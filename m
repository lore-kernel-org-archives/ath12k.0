Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1004DC369C9
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=074WXbpd5ThpINW2gnNNUaKculdaj9LLSR1kExFf6ZI=; b=2dyYnLAfGQz8LGBvmf4wVD/guo
	93XEjwnSYsBy/sDaBJ8hx9eNdgePbz5ZxC9wG8LtMmlNEfDc2R25b0G+g67F43F6HgUSPv0dus/wl
	uGYQDHB7wVQOcbz3bLDm9bpEOd10nJSMqVPT4TPf3D3Kpo5Bbgunwse3e/jXZWIpkJz/Ce1hLB1hw
	fAKa8CgkbRdaRCGz8eLGdn/TQgbqo85R+JYnHZdmloVGpphWi7jyIpHl5gQA2qTSPQMuDVR91tKUt
	rBTYsIHJ3qVs/U72r9yKWY55n0GiDbUxbIbjk9ohhQvIHeK2ypWgNJgyowovWfUGmVTnJGcjw8dmy
	7XfFkymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAt-0000000EVOH-0xlT;
	Thu, 17 Apr 2025 22:57:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAq-0000000EVN6-3fNQ
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClObY008150
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	074WXbpd5ThpINW2gnNNUaKculdaj9LLSR1kExFf6ZI=; b=nDBDPLbbumd+4azv
	pbgi6tjfFyZiom2LAryq9wAWeL0FuTy2iW21kleL4hlWFkPqfGRMK9gCU1Y3QSzz
	imGzCw5JjB8GZcoEv9aBpcq2yiv7JCKGEs0Fs5VD7a33xgFxyMuXdgOed0H6AcyE
	rR4hjyHXgxg4354AfrtAon4xL4C468dFj9qBNlgYCtJhwJhUlBXh6nseXqZn+Je+
	oH0/wQfD+JFHVNntzEiDZKr1AP20xI8USNwEpPH1F3X6WSHsjgirQKsFknC1OHrU
	dILsjlGLWhyubms0JEnYvfw54xG+5IV683of5ImIDY7ToBLupSZ1SySoPgEqJZTp
	4TwnNA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk89fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-739525d4d7bso997337b3a.2
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930654; x=1745535454;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=074WXbpd5ThpINW2gnNNUaKculdaj9LLSR1kExFf6ZI=;
        b=GyQ9I/yx4zq4AuWiJD4k/ZYaJtvC/lyaPL+8Uqds30kEgY6b7Aii1rgE3iN0PXh/c7
         EZ/++BnXEnIGjDzig/fhc03B4pj7OtL5KmzfvXJaErfOBNeLZLkxpYIG19AUCvjbKsBa
         R2ThVbf2E56QJYGJpMNLIuuomg1vFe3HTLTJD0eGcObcPzcyD0++HFZ5hsQ6/VT+T51l
         3KUXkLQaVqQ+K7A80zGwJoqeta3JKgeeqKQe+IZGuDq+daa1Mn3rasO+6FE+Ueo1Laob
         u9YKGcS1fmm6yFQW7v5YXp9s8Q04nOZfKpo7ySxZuOiCiNklINkTkyA7fWknqC+ZBO3l
         5HnA==
X-Gm-Message-State: AOJu0YzddctMnrDeKKZEiKnD9yB/APF9D4UIGZiHdPGa/1rg9JLJ1ukK
	U1a3Y9w5WoBWy+FQKUvV4/qhJUG4ulYR5G0Gv+LPIdFdx+4yNrt4V1o36SK4BNAf17uJtPdBxaK
	XcDspsRlP2bGFytlXoDhnSH3Ctby+S8Fs0vqlAMQsI736XtAjVFbPj7dvF42qvUHQ+J5u
X-Gm-Gg: ASbGncsnEWug0MaKldd+0VbPk3iuW1IWV2f06/LtrP/U/n0v6SWSUm1J+LfwWYak5KL
	TThfIoBuJqCw/eepCFOhdFZFkOsy6zjZyj9lhhh20Cdn4MMn1fHi2pUMKdxnP0j8lzAmThjoAGc
	SYqHLanXT8hfAKpdMtPD4oPGvBHieTZM4u5S1wUW5Rnr/mU0k45DqeSCe9mKhUv10roPM8IQejP
	WZUqmgvqWIOgqgw2xCkg6Za6J6WhIVZ+wmn5ghrk4KKPLNjvl0kM4QqS7P5hyrmhDUaBJKsZjLo
	I3ql60t9FTpSPqj0rAgWZH9Ub6SdAtz3hDJxcrIv2ax9RXxU
X-Received: by 2002:a05:6a00:2e1b:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73dc1616d31mr741748b3a.24.1744930653617;
        Thu, 17 Apr 2025 15:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcA/yAlBjLIAgYZjpL2bpVG8IPuEIYlISSdreAxfLrIsmZazyJSm2hYeaBCWbqALR29xIJbw==
X-Received: by 2002:a05:6a00:2e1b:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73dc1616d31mr741722b3a.24.1744930653156;
        Thu, 17 Apr 2025 15:57:33 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:32 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
References: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 0/4] wifi: ath12k: Fix multicast memory
 leak in tx path
Message-Id: <174493065228.1347382.10308917568690015683.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:32 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=6801875e cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ockaDb-N3DHu-ulF3sEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: _9NX0VyjDpUJkw7yy4x8Tu41rygSTHhv
X-Proofpoint-ORIG-GUID: _9NX0VyjDpUJkw7yy4x8Tu41rygSTHhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=704 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155736_923676_148E5A1C 
X-CRM114-Status: UNSURE (   7.33  )
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


On Fri, 11 Apr 2025 11:31:50 +0530, P Praneesh wrote:
> Address the memory leak caused by extended skb allocation observed during
> multicast transmission in this series.
> 

Applied, thanks!

[1/4] wifi: ath12k: Handle error cases during extended skb allocation
      commit: 37a068fc9dc4feb8d76e8896bb33883d06c11a6b
[2/4] wifi: ath12k: Refactor tx descriptor handling in tx completion handler
      commit: 10ec3d54df783bc9585b98559a1f556019312462
[3/4] wifi: ath12k: Fix memory leak during extended skb allocation
      commit: 1e326ada3586277faa1f67e9263fbc09311986a6
[4/4] wifi: ath12k: Use skb->len for dma_unmap_single() length parameter
      commit: 65bf4ed2db9ac3590c7f0545b6bbebbacbfd974f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


