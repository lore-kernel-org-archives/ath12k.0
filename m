Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71D9C35FF8
	for <ath12k@archiver.kernel.org>; Mon, 17 Mar 2025 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzs4HkHDebsqHMWUpcz0rQUHNmYl05+pZZwdg/tX83U=; b=qjKMkpfwBAkQ+XHCEX9CKdZyFV
	ghfZZ/AOdOf8JvkCJQUOhENJVJQ2J/jW4Ty2P9VOXtSsYJAtldar3+O0cRh6tJcXmG/2kU1p10P5p
	i32MMmuSzETn6cayf7/pC9fm/OK6+kQttSoBaLg7ihkb6l8H6GOhEqDjHNTFnbP5Cll4tZQGD10l9
	oJZ61vi3AuCf83MX6DIoKKp2JHscipjVc/mG8im6DJ382vKd7T0r5VDAsPf9wsLbEeD60ttUd+9mx
	C8U2VSj36GIsIncRY1KiOAd0O9l8ob637lWfDHyXLLr1hSiK4IhVVFSFmKYkfp+mXcfCFiOOmkbUj
	6ZGK6/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFzH-00000003nk5-2QCB
	for ath12k@archiver.kernel.org;
	Mon, 17 Mar 2025 19:18:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEdx-00000003bcL-2kgk
	for ath12k@bombadil.infradead.org;
	Mon, 17 Mar 2025 17:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bzs4HkHDebsqHMWUpcz0rQUHNmYl05+pZZwdg/tX83U=; b=qt847wKzYJUPohddL/NNKKyvlU
	eU44jYx7J2CoT6pUE6Xv20Sr644SeYzV4W9R1B9uy6JIdH0iXioj7Z9oWdf5W5C/DQfMu1d3qA+8Y
	BwNIMbHg4cD+RxbXDSHOp+gLPd+uiYoDmAWSohTT8GJlijjJZLjb70s3RBMs75I4yzZ962iTBy4IC
	lntrnXssp6isDVsKLx3HvNsg0tDFeaWPLS1gK+81/BJbXepFGURpnOKtVI7MD+63+/IZwDj9Ll+Qv
	Weyzc7etu+q0q9dYDmF63IzXcJrnnoi0f9y6H4lQPysS+mTWtP0z65gjqFj8k+qsd+BSxD2/+xmkA
	tp06QEtw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEdt-00000003XPx-4Ark
	for ath12k@lists.infradead.org;
	Mon, 17 Mar 2025 17:52:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA7Pqk022761
	for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 17:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzs4HkHDebsqHMWUpcz0rQUHNmYl05+pZZwdg/tX83U=; b=buuBIghOja7w0aEd
	QynJrgCOXt0eicpdjrRD4m3b5moAMBpJtQejDHxTfVwk/ZwSOovxsZAfd5BXGNn2
	qdw2DNGRznFHCWnbWr897Qh0lZj5lQUtN4NEG/U/PwsX/eBVkEADye67ReVJjAFp
	eBT5VWcQOOm0Rr2ovggTvlJGzYUfzC0U2FE5XZ+gB3+hJlhon5mCniWdWLAVwXsG
	kdmxeSf+pP7cLb7jPHqTZoSJ9SyDjb7GVJ1S0hb+3gtLbFQibVgHxBpAF7VOc91y
	Vg8Oa4s/j0nK9hP3vKA1v5FaKPcTwdWVrNLwxE4kzCq2VsDIpEaxxSivcjYmp/Nv
	aYPGGg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2qm5fhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 17:52:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242f408320so67495485ad.2
        for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 10:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233943; x=1742838743;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzs4HkHDebsqHMWUpcz0rQUHNmYl05+pZZwdg/tX83U=;
        b=ul63KdZuVk9FwDO/n99OOqR+Nbg+p1c0z6ULVPVLOsKP5+E+BPe96WCcbQ3pIMacxB
         AkDugT04o+reJM7YLPqqIFp2+blg3CziqaQDkBJCXerUAEPFATfDNRR3nMFF98zNiP09
         5Ux4MTu8mEudn09gVwsj2wDfnmWhkT2RFclbXQV3N5d0+95YYU4cDy6lug15mATPznlk
         1VFQV1LqdtJPUsD5SrAcEe8DyrVAoQ4Kuox8oCL+hR6VBG779WPV2cPpK6UJYX7qeOFq
         be+NFfGk/LGe71uiGkNMSVowJj9hd7IxJFmTv/rDlwwBc+Dc2L3nYPYP+O6pp1/HgItN
         KttQ==
X-Gm-Message-State: AOJu0YwW040qxUB1ILMRj6rO6l/yAekWSLRYGC8Lu0sReUVQT8Y5dQIv
	ryjeul2lAcpgqZu3MB1sNd4Xn8LU17ICRgwq4SswcYALfOZr9OVkGkHXlNpVV0erAsJWHsAp2fR
	ZYzEtC9i2kAOEuMdj0jB+sTAceXd07XCRg9gma5JhYg/pU6BGZOv2ff4o4BmzGLCLzlzu
X-Gm-Gg: ASbGnctOuusl+eUGzpB4CdkvD86rIO042FaYao24s3YdRAz/W86IxO08Vfi6fujBqgl
	dO/95d3Ew+50lW0HV7GG5G9SLeLJeh7D7nhLonyeT00knql25UPastPHWILSActqaZDhjGJ3EZM
	v5lVzLZaQhOjVBBB8sM7cPiMwTK+juKH2Mh1gx65yvadVQWraLd1ZwK9b4H63Ic9Eoi3Qx8Bk/Z
	4NViOpt1gxm4ty+avffl8ImsTayrhQ3Z0Pv5SGazgmXNjofe65jVlw28/smCqN007SGTAYiB9k7
	BV9fifDxWBUB4dapcAhnUUaBOiS396NUerANghNaQONhLbt6leJA
X-Received: by 2002:a17:902:cf0a:b0:220:e63c:5aff with SMTP id d9443c01a7336-225e0b119a2mr144224345ad.47.1742233943234;
        Mon, 17 Mar 2025 10:52:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLE9fpU3abqToMjpuz/msFYDLAmRBNr3lCiERmeH83aOffmIzWtQW9uD8stNDYwG44wRCqwA==
X-Received: by 2002:a17:902:cf0a:b0:220:e63c:5aff with SMTP id d9443c01a7336-225e0b119a2mr144224065ad.47.1742233942796;
        Mon, 17 Mar 2025 10:52:22 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5ce5sm78291485ad.252.2025.03.17.10.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:52:22 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Suraj P Kizhakkethil <quic_surapk@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250304095315.3050325-1-quic_surapk@quicinc.com>
References: <20250304095315.3050325-1-quic_surapk@quicinc.com>
Subject: Re: [PATCH v2 0/2] wifi: ath12k: Pass correct channel frequency
 parameters
Message-Id: <174223394217.578193.5332056743902918287.b4-ty@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 10:52:22 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: zZTPe-W5-JKzj9dyQkiK7ijVrz6XkJGw
X-Proofpoint-GUID: zZTPe-W5-JKzj9dyQkiK7ijVrz6XkJGw
X-Authority-Analysis: v=2.4 cv=DLWP4zNb c=1 sm=1 tr=0 ts=67d8616c cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=JAv06hZFyUe5PBVjgVcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=928 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_175250_436520_E3D8D5FD 
X-CRM114-Status: GOOD (  10.19  )
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


On Tue, 04 Mar 2025 15:23:13 +0530, Suraj P Kizhakkethil wrote:
> For higher bandwidths, the channel frequency parameters passed to
> the firmware are incorrect. Pass correct values of channel
> frequency parameters.
> 
> v2:
>  - Replaced arg->band_center_freq1 to local variable center_freq1,
>    which is initialized to arg->band_center_freq1
>  - Rebased on ToT
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Pass correct values of center freq1 and center freq2 for 160 MHz
      commit: b1b01e46a3db5ad44d1e4691ba37c1e0832cd5cf
[2/2] wifi: ath12k: Pass correct values of center freq1 and center freq2 for 320 MHz
      commit: 5e44b181bec8e2fe3826033360fc1a42bb432191

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


