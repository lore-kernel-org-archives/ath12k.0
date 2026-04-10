Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86A1F36BBA
	for <ath12k@archiver.kernel.org>; Fri, 10 Apr 2026 06:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boT1DzvUzerPpvXV9ma/L9IhxRQ0oL6ngv+tCq2aFVU=; b=RmOKYXfNgvchqD369IpTVsEm16
	LrnkOXn5i118eBENgNvuwTAmFyQCg9aV+2YBQUxH/OXTmJ42Rxl6MhQnZK2hSyGok3U4hH7lIWVjO
	jDAFtfC2cs6x304FizQq1ZOBnZcua7yQkWCHSvNP8ORaXOEL1GMKMCj8lrx29fZxdxqV18INy+lev
	spXThLGQp7bgjJkGw5O926U4IHjTFwjlVuB6UjkxrE4m+NVR+IBpiv7QYZ+1xWgOOKB15Ln2jgapa
	RTWQIC81Q38KCcE8baerpyw14OEQBTXmiAbb9Cx9mEnE9u1UhFs8A/FmDRRR2lLsMqnwt3zmlXEkZ
	iSdbvSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5YX-0000000Bh1U-1dtP;
	Fri, 10 Apr 2026 06:41:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5YV-0000000Bh0j-05KK
	for ath12k@lists.infradead.org;
	Fri, 10 Apr 2026 06:41:28 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5Ld2c3352591
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 06:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	boT1DzvUzerPpvXV9ma/L9IhxRQ0oL6ngv+tCq2aFVU=; b=jymZOp4moS4HyhXt
	O/wb7UZhQWIttn1vJ+SfmkWCJAE0WjqpTo/6nzNd3IyqmgTCBkl0yA0Rsp+cvUsY
	2SlPeg2A61VbqsMx/bs5GwZtpssdQQM+pDIMqNjbL9ICUovHt1rRiMuXxh8PEISn
	y/CtgE5EaiuVLxf9zNdBBdFV+vMibXPqcW+TCCJcFDUCzTRABzg0Uqfj8deQlVa0
	OwCGvL9r2WSHH94gAbvTF9aeKI2D83yDeHqE2ZPbbvtBc9PdJMuTbIjbM6XyftQn
	hBiKzKkPOuAehLCIEkJFsoT233SGEUCMR6DQBLeLhugTZ7lQ3ph03auaoRMrimpD
	rjveCw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qu8f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 06:41:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad5fec175so25632645ad.2
        for <ath12k@lists.infradead.org>; Thu, 09 Apr 2026 23:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775803284; x=1776408084; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=boT1DzvUzerPpvXV9ma/L9IhxRQ0oL6ngv+tCq2aFVU=;
        b=dR9h7IzIjuNHUJm6E7aip/LeKOaqZAtV6+VaN2y2Ei/d03Bp9sKI8iUy92LDI2C4of
         e4SZcXnjbQGhcbcwOBCM9HnAVYUBwN+lpwqV50DpxoH0Kw0NC49z5k7ZwyMcktmU/jfb
         qEnWmuoYdQKKtgDesa9Tp4Vh3XDsdq9X+k89+vE2AolrlcKOVYISi5BFH1KddxT4Imal
         u7QA4XHmKQ5RkoazdBZiF7YyWKC9b3zgFKPJr94UV2PjVCpPjSU9z/xdK9XsFTuTC678
         xSTqjozL/6ZvRniTv6fVa4Kjj9ypcNePFQv5m6jXGB1ZijEBCakifwTywXEBPXIkW3qL
         nZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775803284; x=1776408084;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boT1DzvUzerPpvXV9ma/L9IhxRQ0oL6ngv+tCq2aFVU=;
        b=MBwQlwU+AyESIK7kTOCjpFWprEK6FKkOHB3/S4SyzNRjxKJIFdiRTxiP+3zVdGjXvM
         5IIxAdWs/UHsRiIBnwb/aDr+Bpfv+1d5ImdC34jMxij7NoPnqQx0adEqZQJvYCFzwpns
         TBJdhG/tAg4uYuoCzeVJNmioO1RIdf89vzvzKFk4+9s4QVioXYPehxdn0S2/deCiBaVT
         xfrzD5TwMwecVAqPmc9Ok1dvTk1oa2zN+LUQZ6kMcFl8Pesibr13qR2lcgldZq4cyL5T
         2PaQQVVqN50vV63/d5Z4VhRxpO/Uu6s49mReCH/UM2279SjNwTkMWvoR+hBpJVXGuwHz
         kMOA==
X-Forwarded-Encrypted: i=1; AJvYcCVO91e157fCVBSBeTWwOL3S0zG/G7ocHgsS8KXgbOPo1Q8vNHt9uYqEjJCCKXJpLu1yxu1rSSU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLgEeAAKtzLj6VQbBDrpZiw9+fnLRe9PYNkYdnfytwytIv8i1k
	oZa5wuSx8DF23rz0eNWj1b4d2r78RhcSopPsD6QhEfx6lHavK3JQQR/AopMZmgZ+Ka6tc5AaESC
	CDZErao6/b8lmwrUuce3z456aKEhYCV8aIl2qRdYqMzx1zIv4rZc8I8vuUYrjDOnj
X-Gm-Gg: AeBDieusW9k0J5MtgB7/tfrQLo7nlsR6+iuVygiGe7u9li8F0bK8PjqVKvkxqaHYaeD
	KVr3rTRDciLIywH/dCMYxzmskMH2zzbxnBjYW5dEl4ohyMzNUxDVaH2FauWuCOW42h/f11CLhK+
	BOlQkF4WEOPnOITp07tqjncUH68+t6idNIycFsZIB+2BBobYUgTtzs8MeeARuDiFKnTAEVWHllA
	ok+2MNMhqdloriOuE9MixCjpB9YthNJA/Ok/Ggif5AbVQpjdX4LW7sa4EuCZWO0wjTxrYTxgUMH
	iQlhfVAsHprKxGhyCIscHAMVCmdyDsL9GkxMEVb0gFEmGdwNTI9sH9meScG3pbQ40cKX/eHXEOV
	4CJzypw3mehFCt/6GF/zDhU7Nn+JvqXHOBxGy2R3RWwGAJLQOxtVHVL9jbHJkAk2G2TH3iTkTXS
	DFXxh3JJyN2pc7n2Ko0PQ=
X-Received: by 2002:a17:902:b193:b0:2b2:501c:bc0 with SMTP id d9443c01a7336-2b2d595b609mr17481865ad.7.1775803284488;
        Thu, 09 Apr 2026 23:41:24 -0700 (PDT)
X-Received: by 2002:a17:902:b193:b0:2b2:501c:bc0 with SMTP id d9443c01a7336-2b2d595b609mr17481655ad.7.1775803284030;
        Thu, 09 Apr 2026 23:41:24 -0700 (PDT)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddb462sm17255465ad.24.2026.04.09.23.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 23:41:23 -0700 (PDT)
Message-ID: <d6ffa7eb-a589-44b0-ab94-5b4f8f21fd44@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 14:41:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Consistently name struct
 ath12k_base pointers
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260409-ath12k-htc-proto-v1-0-cda86d6355f1@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260409-ath12k-htc-proto-v1-0-cda86d6355f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MCBTYWx0ZWRfXyw9KcOJrHjy5
 iRHny0eWWOnh+nkuCs+JIFDLH0FByNdreU+PUACEI4K7L7GhHYQt8H+gHFbGoRYYn8sb+y1lxtH
 3ajdNoeLXmog/0XI2z+77jNmXA/qcYq0SJF3vTVqzXHfoqU0sFfNSy2Ve3buGUYlLBRejmZvdMi
 B+7RlSjTeE+5f7PpNRFSE2BMiMun4wGVYBXd8UrJmuYum9oF4ESNEGkGprlyRjz7olGyJvJAuR2
 Q8R1wnZJVIjTSoGdwOjhQaqOECOaiYuRewcErbcefr5vcLKwdawORzaaePISCN9ubLhW51hOzfx
 lg2t4c2UGaY3y+ssfBVn3nnlAjYD7mYIbqSJ9hvxsdkgZQ4KlC7q6j6i8HsEctPN94uqHgYRQL8
 KwdcCPuDWbW4co1qLOQ5wcYal/ZVx+pLYq66OhzQm7ueKMUyfWYpeg5B2ynWODj9Ae+jq2JIfZB
 Xg0JuZ/aPcV4Xyp+Vlg==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d89b95 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=YBKe9LgOGv_X2R6aZv8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 2IGYMZl10miVlUUcZfka2_fcmPArJDVv
X-Proofpoint-ORIG-GUID: 2IGYMZl10miVlUUcZfka2_fcmPArJDVv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_234127_237290_13B87167 
X-CRM114-Status: GOOD (  11.28  )
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



On 4/10/2026 2:44 AM, Jeff Johnson wrote:
> Per ath12k convention, a pointer to struct ath12k_base should be named
> 'ab', but there are a few places it is named 'ar', so fix them.
> 
> Note that one instance in ath12k_wmi_tlv_parse() is not modified since
> that instance is being removed as part of:
> 
> https://patch.msgid.link/20260407095426.3285574-1-nico.escande@gmail.com/
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: Fix HTC prototype ath12k_base parameters
>       wifi: ath12k: Fix ath12k_dp_htt_tlv_iter()'s iter() signature
> 
>  drivers/net/wireless/ath/ath12k/dp_htt.c | 2 +-
>  drivers/net/wireless/ath/ath12k/dp_htt.h | 2 +-
>  drivers/net/wireless/ath/ath12k/htc.h    | 8 ++++----
>  3 files changed, 6 insertions(+), 6 deletions(-)
> ---
> base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
> change-id: 20260403-ath12k-htc-proto-9cdc961f39dc
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


