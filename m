Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA44C369B2
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 23:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmeX/479BKv3qKmBj2le1lVL00q3aHxi+GaUMpOQmEo=; b=YBznitsZr96Y5jSvftfrE2ANrN
	2inhe4TBReOEZhKw9ZLh9ma+yHXqGZXVejmbF6PjKrx4DlnOb0Z7DRUDBGhKx/kaOUdjXeaNrzJSl
	wAOG0VoVg3YNZ9kQeEJh9XSFRHTSH3tQetlasoElAw9YW4PxjH/4FuA8esJCR9HEHc+a/pWyG+Asr
	mXsPkbItAUs48cSfNY6KX0AFW6bUoZNjquEF+DCIImdhO4FfzjDfUtCK56thUx8QhLJ2/5t8MmJRS
	EtPNA19DAGsGv5seRdCcsySLdteHh03YAuSlaZ4lVnHzYtoJYxcqljtXfvj5bjJPhGEs7lg8lm+TI
	eOERGvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4T0P-00000003sJk-1NzD
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 23:14:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4T03-00000003sAf-1B9M
	for ath12k@lists.infradead.org;
	Mon, 14 Apr 2025 23:14:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKdmQF025864
	for <ath12k@lists.infradead.org>; Mon, 14 Apr 2025 23:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmeX/479BKv3qKmBj2le1lVL00q3aHxi+GaUMpOQmEo=; b=ODSJNq/oE8CuFHCK
	KcqkYEUwTPgXFKU6lVyCbd1/GR+2xJt5LY5cncUyKdRdq/qbpKsHdObLXb0B5IrM
	qxqB8CXTH+9Vm/0DbjLBypGxNj2NyIuPgJuA2oM9XmVj4pJHFx6r9h0rTSWhCv32
	t1In9d8fR6H35RBPTWW8/Y/mrIqy8onIrvBVfexc/+Zoaq93WISLBds5O/TgVvo2
	A3Zeo3MyCUuDV5f6rkP8/Z6v/2V//RkEy56+ZqQgSqWg6afd/PDqLZ6kWCck4evd
	CyyFVtXfowx8AWjxjTGJhM4b4ygiKw8WsII1Gwj7T0xO0JsGeKvQMBpph6J2S7Ne
	JXKKUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjwwf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Apr 2025 23:13:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224364f2492so39163865ad.3
        for <ath12k@lists.infradead.org>; Mon, 14 Apr 2025 16:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672437; x=1745277237;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmeX/479BKv3qKmBj2le1lVL00q3aHxi+GaUMpOQmEo=;
        b=ek7tndKUdJTiJz5kRs1eBek2ra3Iz9GD/FwfhqnfO3+XzX3VB04mdbLz7DiC7tKk9S
         l6BIgvAgLfi2sfyVjchSPIaPxUehWrP3QdLCccO/Ohe6l+TsN1l3jKECqcsEEAbNLDWP
         TmGh5gSkF4MhEg0NmeSeUwhIV0Hgf7fDJIq/SwC+AASkJQ3GU9jy2ne45WULAfi0iH+H
         MgFjcQt4RlEQpl0bm94gc81AK9vC2WB2j51isWJam2426Te+LyvlAsZp9eBjIDO7C6QE
         0xA7duxmZb1Ivcwx4c5kxh7AtWt+12m8Eeuv59XzfNcmJEZDtIV3g+fQN97pczNlBrnT
         a66A==
X-Forwarded-Encrypted: i=1; AJvYcCWYVXZdms1tSzWnZDnPTpc1j+lBxd3nHYTDD4e9TPu77xi8TstY/o/BSXphhJDhHxAEkMJJuYU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yywvgk+YOPgb1uA7/LEmQV7D+7W2YAqrZp9SakwXDpiEut34kmF
	Zd0/kgEG8NuuV11KF9zK6NhuXXDTBe/f1rmo6fnyeiTufBgIZwGMHsGUMh1twvZZCJ23R5amUbc
	pQDTnu/mt/FNDDvBC4R2N3NCuFvGyqHzNRzVbdZN3AAWxUwUuDfrP+ZXzfpNe
X-Gm-Gg: ASbGncsb/XRBYEV8znmGMtA60mb+FcrDSSxZ1zdixf6Z7vff9PcwcqEEraPlr2mpsCm
	TyMw2P1ONyDtqzgwRDBFW1h2tg3Ow1iyr3U81K2bqgnkdn6ce8Lb51ejDyiRQxu/pqWXwmdiCAN
	aBwJSlC2Od+vHhnE+lghqzsWlkkHqUngEZBze88ZJ4TJdMJfViooFLagZrzonD/3YqRn+jU+3Ey
	LVHl+F89atG1IQTimLBShawbAUVRcrXGSJtrHUzepkgVZpT0WvH+7XKU7ZQP1HDKSVLOzRSC5Ow
	/nvEXftzxXG0nKs5YKY28q52gvps6KCPOrCLyvbKFISKCBtrKu5f43ynaH0Rnw5pG/XYEMMetpr
	QbsnF
X-Received: by 2002:a17:902:e544:b0:21f:5638:2d8 with SMTP id d9443c01a7336-22bea5174ffmr219282285ad.53.1744672437278;
        Mon, 14 Apr 2025 16:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1PLRVUfgCNDjQtJLJ9u7XHiAQVtUCmKhzT9Rv2mGdyHdvZgOc0YNkpBbEu1SGUWwSapbFmA==
X-Received: by 2002:a17:902:e544:b0:21f:5638:2d8 with SMTP id d9443c01a7336-22bea5174ffmr219281985ad.53.1744672436813;
        Mon, 14 Apr 2025 16:13:56 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230d697sm7169819b3a.123.2025.04.14.16.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 16:13:56 -0700 (PDT)
Message-ID: <702c843b-8462-4594-91d0-75721ba5dc48@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 16:13:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] wifi: ath12k: monitor mode cleanup and state
 handling
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250107025621.1907-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250107025621.1907-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fd96b6 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=q3iC_Zviv3GNssnXIB8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mHrz1U-UdrzCKCyU8a2RHbKjobBtOBie
X-Proofpoint-ORIG-GUID: mHrz1U-UdrzCKCyU8a2RHbKjobBtOBie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_161359_347982_94A35463 
X-CRM114-Status: GOOD (  12.08  )
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

On 1/6/2025 6:56 PM, Kang Yang wrote:
> This patch-set do some cleanup and handle state variables correctly for
> monitor mode.
> 
> Note: The quantity of this patch set was 11 in the previous version. 8
> of them were merged:
> https://patchwork.kernel.org/project/linux-wireless/cover/20241022110831.974-1-quic_kangyang@quicinc.com/
> 
> v6: update copyright for each patch.
> v5: rebase on tag: ath/main(ath-202412191756).
> v4: rebase on tag: ath/main(ath-202410161539).
> v3: rebase on tag: ath/main(ath-202410111606).
> v2: rebase on tag: ath-202410072115.
> 
> Kang Yang (3):
>   wifi: ath12k: optimize storage size for struct ath12k
>   wifi: ath12k: properly handling the state variables of monitor mode
>   wifi: ath12k: delete mon reap timer
> 
>  drivers/net/wireless/ath/ath12k/core.c |  7 +++++-
>  drivers/net/wireless/ath/ath12k/core.h | 27 +++++++++++------------
>  drivers/net/wireless/ath/ath12k/dp.c   | 30 +-------------------------
>  drivers/net/wireless/ath/ath12k/mac.c  | 13 ++++++++++-
>  4 files changed, 32 insertions(+), 45 deletions(-)
> 
> 
> base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f

If these changes are still applicable, can you please rebase?

Applying: wifi: ath12k: optimize storage size for struct ath12k
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/core.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/core.h
Recorded preimage for 'drivers/net/wireless/ath/ath12k/core.h'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: optimize storage size for struct ath12k


