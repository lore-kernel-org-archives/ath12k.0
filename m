Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22215C282C6
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 20:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByesdkJdilz+ehzKjpueUt6R7NGEBY8xqZsdamzsj10=; b=PaM/djD6C+BfD2nYVSzHzHxJNv
	x+7K3qaFZc4CgkRDg+cU/1D1uFJcvAY6jfDxiMrnESH3PKnnVng0y35f/Ynx6SHf0GZatDL/Qzjw2
	aJ1z8qOPVZK21OCObvFmNTTWoIGQph3XdoJUKCdHyQ6QeH9aeNiLVXTSSNiOEPCmnjiuGyDrWmPfi
	Kfy7o/ciHnR6LA9TOJRg4mr+vnzBAHG3soEivHt9twTerwmUb6hFnKlLT/776RH/SbYoE/p0X2Xvo
	LTM7TDkKlvmoN52mp+Bp7w8GgIBBI+kpxw3Swv9qPJi+zBN/ernhVsl/mssq3Pvadyc41eBsXp0Tg
	aVoZLwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6dd-0000000CUvG-30MJ
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 20:07:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Tc-0000000CRrE-08Kq
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 19:56:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SBfCaJ022567
	for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 19:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByesdkJdilz+ehzKjpueUt6R7NGEBY8xqZsdamzsj10=; b=RBsOG+NAEEmt62ql
	SK+o4FUPU6FgBRhO0uUxFRi6/ePQ5hXZMDu5891NMjnebPf8KzGe8u8RxMWW5YJg
	G5d8Lo/jG9mptJVGeWZgAZSVwQExtbttEN7+MEazoNtDcIm5LA8lw9BOfpUjkAWh
	Kf6JENwZSgkj9zhNJkk4+SdPO4c4XsDrUNmQSwc9w3faA5NrhZ/lDshSNwm/3529
	fyfBGq9jhQ2qXOx9Wt+fQlVDu11FQKwkWOWnYVjn717Ta9A0kq5MyqDo5ttgvT13
	JqbK1cGaaCtiFjdIo0pLFiJcSqj6bFZ84TYTIsAUednTBX2X5xUU5g3g8FqA1czN
	Un1VUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453cg3sbga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 19:56:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2236b6fb4a6so39850505ad.2
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 11:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740772609; x=1741377409;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByesdkJdilz+ehzKjpueUt6R7NGEBY8xqZsdamzsj10=;
        b=GtcJSAKBQuzGtgxf1xIzZUByNLXWuBwjGqYsd3aeEOS5S8L107F3HIK6cWzpauXB9+
         GQploSEVM0mDqw+RrLZeXKvEfTvfRVwj8MIpghaZSxxPQJeWJfCuh8LKhKNZuOFK1Rez
         8E7NxwuUwEBfr/HRkXBI+3rRUvjOoeGhUxgjoNmMp0YFEXRxxujCdHjDMD0LTPwjRmPn
         PQCkPUVvuqi/AKtPRAZWt03BAwMVq47d6tlbNs2TUeMyX0Yf0fVWPg8qP3uXGpiZg78b
         guHt+gkLGkYW0QBRvrez7/EMV62s2LBWWLoj9TFQxoiX0VVmAR4gO74jOokkNlMqnhFu
         OqqQ==
X-Gm-Message-State: AOJu0YzckEyv1RlmE0uG3Ju7m3OLjSfEFRIVE+o2ocYknT3CWPhYXYVs
	bVtfxUgcUoYHMfJKiDY6/vccxxrWY4j9aT9ZWxzxCA1pMCJMw0SFtANhIEZnfdkUEUrx9SSGhWG
	chczTyO3ZNYZjStbN7g2iLtP/g3LabsOoZMf4Ny8Y0rSrz/Dy6+GcGSoZoNfrGCAT9iK5
X-Gm-Gg: ASbGnctJnaeH/2DbC0ehfY6bdWccDCSRGIYOJLnO+LlVyq0U32EYzXhxnU5ejUjL3KE
	Q+/U3uiS7dU/gZGF60yC6degyDmfNfnGERDIn+Pb8O7wF7LSA1HxVO3UloXlaHjBow1rVRVC7iz
	d7mAoYjDTg14wm4YCCMpzdRoYUF8TFJzWpfI9oAGvGjxzTAnFnU0LGHQwHBCih0ic9zp7dcH0Gn
	zTlbm67YBRdI2Cva3O+7u1vQKq/xOTGa81+FoL2iQehO7qD5F62yYx9Bq7mZp6weaNeUqyu86Mo
	H4CoQ8Suz4X+xDnFdHhbjeXW2/RdZ/E499j+UMUeizE6fg3S8v17
X-Received: by 2002:a17:902:d48f:b0:223:3b76:4e07 with SMTP id d9443c01a7336-22368f5fcfdmr79672975ad.4.1740772609298;
        Fri, 28 Feb 2025 11:56:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEoAEj81dI4u+5uZ5w7A+NLRFGQRCca7o6x5FFElmN0c302+N9hshe6ZIHkdpXqZ0wM/ISTA==
X-Received: by 2002:a17:902:d48f:b0:223:3b76:4e07 with SMTP id d9443c01a7336-22368f5fcfdmr79672715ad.4.1740772608970;
        Fri, 28 Feb 2025 11:56:48 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505336ecsm37140165ad.244.2025.02.28.11.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:56:48 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <quic_mdharane@quicinc.com>
In-Reply-To: <20250211090302.4105141-1-tamizh.raja@oss.qualcomm.com>
References: <20250211090302.4105141-1-tamizh.raja@oss.qualcomm.com>
Subject: Re: [PATCHv2] wifi: ath12k: Fix invalid data access in
 ath12k_dp_rx_h_undecap_nwifi
Message-Id: <174077260831.4132177.17474173179510814849.b4-ty@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 11:56:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: MNPzrV8SzOrqefCbwYmh9eWEXT3hxAtt
X-Proofpoint-ORIG-GUID: MNPzrV8SzOrqefCbwYmh9eWEXT3hxAtt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_06,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=784
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_115652_078983_4800F075 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On Tue, 11 Feb 2025 14:33:02 +0530, Tamizh Chelvam Raja wrote:
> In certain cases, hardware might provide packets with a
> length greater than the maximum native Wi-Fi header length.
> This can lead to accessing and modifying fields in the header
> within the ath12k_dp_rx_h_undecap_nwifi function for
> DP_RX_DECAP_TYPE_NATIVE_WIFI decap type and
> potentially resulting in invalid data access and memory corruption.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix invalid data access in ath12k_dp_rx_h_undecap_nwifi
      commit: 9a0dddfb30f120db3851627935851d262e4e7acb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


