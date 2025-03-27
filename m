Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01474C36013
	for <ath12k@archiver.kernel.org>; Thu, 27 Mar 2025 22:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kukxmb9dYO7oPUmf/OKc7J6CPSGfAzlCM/uBo1yrOFQ=; b=esyXdI6oGDtCbkgexd8P9VpYzh
	xE+Rj5tiGqgVowzKpnZ2IJoopaRJGf2XK/e8pCibvs7I5o/1o1lG4cBMkBVKkFTkM5Q16L6FhezwR
	UrQajNuUCCQmlEOyr4YYeaX/bpv/O4UUX+OUDo7iVn1NpPnx9gKHZ0WcBMpg50cMGt2ZJ1q4eemIW
	c1P2KDGRu97IPuVNC3bhvnvb7TufZKqTmIeNM2k8oexXX3gJXhQQv2b7ouV1y7NauDAA2TGaIuX79
	FKwBvjGUtRFpL8B9xVTQEJldGQqXfj47v2/PzOE90rKOeNC3oBeblwNeS/8uVcvCd0oqn9aUnQu8e
	03Jjtg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwBb-0000000CBqG-39O8
	for ath12k@archiver.kernel.org;
	Thu, 27 Mar 2025 22:58:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwBY-0000000CBpB-0hU0
	for ath12k@lists.infradead.org;
	Thu, 27 Mar 2025 22:58:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REYojo002239
	for <ath12k@lists.infradead.org>; Thu, 27 Mar 2025 22:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kukxmb9dYO7oPUmf/OKc7J6CPSGfAzlCM/uBo1yrOFQ=; b=SNJ5FmNMnatP3eAR
	tG4BZNBwrwuNn4T9dmk6QBeHKcGkiAw6ob8qzkbSfvbLmYJdOoSl8UD8fiJjcF7f
	HZPBcXWvocUX05SZ4UjlxTVSOYC7ybXIPZiTjC1TWUBD4oTR12vaN2I6jBg9ZLVI
	QpL5rVkOE7PBC2Wea+YqsHkUwg0R1P0csYnrnS/jDrRMLPC+VEef4EfJ2sQ+v2lr
	nKWRHqwrP8UAt9+J8kjsW2ciCREgZtIVKg1W65WQPxYM3vGswkT++nSsekDQH1F0
	hsJ6S2mGBHMjV0oj2BSDehaqS+zOOqPIWrZcFLHUP6DYHfMe9dYx8y05Bz2zbG2p
	wzamUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdyqdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 27 Mar 2025 22:58:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254e500a73so20664305ad.0
        for <ath12k@lists.infradead.org>; Thu, 27 Mar 2025 15:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743116328; x=1743721128;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kukxmb9dYO7oPUmf/OKc7J6CPSGfAzlCM/uBo1yrOFQ=;
        b=jya9gCwdZNczjNCzOGpFxVL8ZzuEf2utTKPEaxj66M1EUJVyMBV2viZEKssro1Iqbq
         TKWCR1iJe/PXR9BFELYN2UjGNUfKoo1VwtAaj/UFbf+ru8US0QQmNXD6IOHzXTeWMxTg
         IPKzxRfLn/hFu4uU5+RgN/QpUIEPqOPNNT3LdU9VRLzwlSnx0YSAFD/gFnTOTcBgP9v9
         N0DdnSqA7hOqetaz6QkovhqCP6Bbxb7w3sNNTqoK/dItX4ypRPqhcH7KjY1XAMc6ggqO
         ktikn/B9smPPN8qr/XKv7pgdEg6OPpwN0DikiOJ5wJMEzejJgC4u3K1IWIo9fRC1urwe
         NKjQ==
X-Gm-Message-State: AOJu0YwqMZMTS6Ih3qYS6qJ8gBw0g2zNkItHm+Iv8V64Vydd15KAw16E
	Tzf+XyRGorOipqEEQz3rhmJp5SKhwpTvb6TwH5a5KRkSyzAihKX8glmw3jfDFY3dZECimf+kmQb
	j6QKqysVjUhu/l15SMWUr5EEnZbpkvwwOm1TRdKUvPkNJ40Edifzg6etEXgEJ
X-Gm-Gg: ASbGnctzGMasaoR3qGBt5UPzhBYB0jUCcJD2b5D1H3rvtloeLz6xgo/3bxzpSIzFRaK
	Gesdoi4vxApZUq2iRmtp+JKG6BXZfys2PRfi8/AwsS1og8WgCXxHLsyZAjIK4JSwNx2H2DnTimN
	DHPl+wCGRIu2h3MF42JUa8Cpts6i6rMWu/uZtdT3ixjynpRt75E8S9vrg7e52JUyn/lsYqDyO6B
	fxqgzlFesG1QRE/JXqK+Uo2F69F7fhUAcl3S+W8HMD0k/pRDXSPxuIcuh7+avEq2NsXGklTVJdH
	Ni9ih741WwjfIDBVoeIIIBc3EXZT7VGzsPyO+riIvGls5kL7u8YM
X-Received: by 2002:a17:902:d507:b0:223:7006:4db2 with SMTP id d9443c01a7336-2280489c923mr89742965ad.31.1743116328049;
        Thu, 27 Mar 2025 15:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr97TIlNq2Evkp6K9STR5+gbzTaqkBodaCbfJ2zsbgn9bbVwsjfEp4917/3LcYLwNEqSy10w==
X-Received: by 2002:a17:902:d507:b0:223:7006:4db2 with SMTP id d9443c01a7336-2280489c923mr89742645ad.31.1743116327528;
        Thu, 27 Mar 2025 15:58:47 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec7bb9sm5442425ad.6.2025.03.27.15.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:58:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250324062518.2752822-1-quic_periyasa@quicinc.com>
References: <20250324062518.2752822-1-quic_periyasa@quicinc.com>
Subject: Re: [PATCH v11 00/10] wifi: ath12k: Add monitor interface support
 on QCN9274
Message-Id: <174311632682.448522.2851136834591383462.b4-ty@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 15:58:46 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: 6-TuviF0Q4g5BbZzz7c7WHvs_z8Yzc57
X-Proofpoint-GUID: 6-TuviF0Q4g5BbZzz7c7WHvs_z8Yzc57
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e5d829 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=Dalc5V8WfDTeSt3ZhMEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_155852_334850_42519B92 
X-CRM114-Status: GOOD (  14.80  )
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


On Mon, 24 Mar 2025 11:55:08 +0530, Karthikeyan Periyasamy wrote:
> Currently, monitor interface not supported. Therefore, add the missed TLV
> tags parsing in the monitor parser, configure the monitor vdev state
> identifier with HTT filter setup.
> 
> v11:
>  wifi: ath12k: Move to NO_VIRTUAL monitor
>   - Added new patch to avoid multiple change in a patch
> v10:
>  wifi: ath12k: add monitor interface support on QCN9274
>   - Cleanup the VIRTUAL_MONITOR handler procedures
>   - Removed "Reviewed-by" tag
> v9:
>  wifi: ath12k: fix NULL access in assign channel context handler
>   - Updated the commit message
>  wifi: ath12k: add monitor interface support on QCN9274
>   - Removed the mac80211 callback config handler procedure
>   - Removed "Reviewed-by" tag
> v8:
>  wifi: ath12k: add monitor interface support on QCN9274
>   - Added comment section for restricting one monitor i/f in each radio
> v7:
>  wifi: ath12k: Refactor the monitor channel context procedure
>   - Added new patch to avoid multiple change in a patch
>  wifi: ath12k: fix NULL access in assign channel context handler
>   - Added fixes tag
> v6:
>  wifi: ath12k: fix NULL access in assign channel context handler
>   - Added new patch
>  wifi: ath12k: add monitor interface support on QCN9274
>   - Moved to NO_VIRTUAL_MONITOR mac80211 feature for adapting single wiphy usecase
>   - Removed tags
> v5:
>  - updated the s-o-b as a last tag
> v4:
>  - Rebased on ToT
>  wifi: ath12k: Replace band define G with GHZ where appropriate
>   - Dropped the tags due to rebase changes
> v3:
>  - rebased to ToT
> v2:
>  wifi: ath12k: add monitor interface support on QCN9274
>   - remove redundant filter setting in ath12k_mac_monitor_start()
>   - set the default filter when the htt monitor configuration get disable
> 
> [...]

Applied, thanks!

[01/10] wifi: ath12k: fix link valid field initialization in the monitor Rx
        commit: 2826139f9295821fe2b049318a1cc057ec003131
[02/10] wifi: ath12k: Add extra TLV tag parsing support in monitor Rx path
        commit: 3973cda5ef496fd412fdec2c7c3403ac90e391b8
[03/10] wifi: ath12k: Avoid fetch Error bitmap and decap format from Rx TLV
        commit: a6621bf6397ae6981b5041ba0a127e7dbeade746
[04/10] wifi: ath12k: Replace band define G with GHZ where appropriate
        commit: 6a88093f79ea0b131e5feab9cdc045a007fad26e
[05/10] wifi: ath12k: change the status update in the monitor Rx
        commit: 5393dcb4520911f2b4a980e7e3c2c0de2bbf9ec7
[06/10] wifi: ath12k: Avoid packet offset and FCS length from Rx TLV
        commit: fc1771b9c59e284e72b4fd2e9e405cd220898c1a
[07/10] wifi: ath12k: fix NULL access in assign channel context handler
        commit: ea24531d00f782f4e659e8c74578b7ac144720ca
[08/10] wifi: ath12k: Refactor the monitor channel context procedure
        commit: 1dfa44db967c5c4f73ba5c9177aeaf2dddaff574
[09/10] wifi: ath12k: Move to NO_VIRTUAL monitor
        commit: 7423b64191e325681e0198f4a8ccfe66f282b95a
[10/10] wifi: ath12k: add monitor interface support on QCN9274
        commit: 2c4c3aff7362b09ec356bd9f3b7cf4a718307264

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


