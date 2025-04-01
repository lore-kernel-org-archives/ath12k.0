Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A67AC3600C
	for <ath12k@archiver.kernel.org>; Tue,  1 Apr 2025 00:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nj98MI/Ht+TuXfUcrmfWsvc4nni4nX6/r0YOfJeFQ2Q=; b=EDDoQWMxkjO/nBmufPKIgajW7U
	gkIrLBPsucpcdmgfFLGBuhP2S2m4Jki6VW8RVtVbYpAGTVjKxuRF5mxBR3nHP4MEKcwRK41uMa83B
	48zS0nvQr0LEqid58OCkUU32NBAytunBZQ1TrsN2xHSQwVKOGFTE5BSOf93DKqCztd03djJXNfqP/
	xIdQGjT76Of9/uDo3W+FOnKAzww4n0UiUHKrTP4gk2JcFH9E43/Z3HdF0+cKVPJO0SY8HMkR7jAmh
	0r/kKm/0D8ZF2o20YEem5fh1WRPNO9YKM+9Y4xA+qOb8lBN5Z1e2NteKrOIMPBpNzGJFwHIo1EIDd
	rYhAAkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzPSQ-00000001ead-3xc2
	for ath12k@archiver.kernel.org;
	Tue, 01 Apr 2025 00:26:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzPSM-00000001ea3-43ni
	for ath12k@lists.infradead.org;
	Tue, 01 Apr 2025 00:26:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5310J4LQ032238
	for <ath12k@lists.infradead.org>; Tue, 1 Apr 2025 00:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nj98MI/Ht+TuXfUcrmfWsvc4nni4nX6/r0YOfJeFQ2Q=; b=CgHsKl7Fdn/Qzyl3
	hDaCLuKCRQnNGonBVJc+/rWIZj6e/F5p591B9UJOib1BXswWdVZ2wv2aHJxfm+bM
	pa1j3kaaj0kZj+ThqZmaZTjH/BQMnbQpvNfAnvkJBxCOePwbXT5yQBVS5WjAppGB
	3yq+tscgzeX8fJ6YS5LZy+1ccp/17MsoaLiWL8vFo0MTuYpmHqTg2l21QSuf7JA0
	vIT7pZQDmdHchFnGMvGN10Z8/t7bTynzaNnRHBJZsP4Jjgn9s45PVDvnn+53rQhP
	p6rq1JtzD2Mro/S1pvhfkST8UI4vaJnNpvK/2OOYbFHXMHpWfWE3Dt6cabM29sNS
	w9M94w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjnusr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Apr 2025 00:26:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so1791823a91.0
        for <ath12k@lists.infradead.org>; Mon, 31 Mar 2025 17:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743467177; x=1744071977;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nj98MI/Ht+TuXfUcrmfWsvc4nni4nX6/r0YOfJeFQ2Q=;
        b=m6IheBNYGuS9OifBa+AGA19IKgikAqMeAX0WvcxQyTvuwkGDviV8UQUv6Zb351f342
         f/00yAzWElIMVUjLqM7LW9tqUjPL2H7GwQccMuttRX9CLBRVBqMtddCHcgi7SlnPMCAc
         e7BUwZ343zy/tYbQ8nzwzvzCdauxvMU12u/8bgaw2ky6RLoCFrWGRcr45TdzKElrVR6k
         VnzVXZW2psfQsy3tMzyJyDMFMr+bUTePSFrLHD0DFu+nQ8yzyEEkKtVX+xNeb4q2qmbH
         wqpqXEfb5nO53sPHZGo8jLEGglNzM8B/YU3trgQ8spmI60p7Wu+/fnB8whio5rN5t/i1
         6VAw==
X-Forwarded-Encrypted: i=1; AJvYcCXvMVZRValDXT7O5eVckHEwdi3ATRtWngGbSuOtTGbWILHRfFHLUW6PbHpMk9ytSmraEU36toY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHzduBHycetk3swt6wJtcJnRmuk21QDu30R8zcfvHE7neQSj0R
	PZvpt3ErKc9CybA7kMLQn8a37w9iyU7CTfPuP6VYRZ4eiPFOvZ34k5XePiwH9iOVqp9tbNROO1M
	9S6oOAy2mmwcDA6QYQ/tM9Oz9n5nQvXvIOriX53nFPV3ec9zFdUsVTTLcsot9Qv86mywR
X-Gm-Gg: ASbGncvEZ/DiS0/gODxPdHzuGif0kQBmKiut0tSG9a2eA2pjLpRTd2qTJwc2vIu7lCN
	wgzb1fKBzlENmZWlj4fuzYYWN1sOz4wFNfX/cD/1ae0J/VUlPVuT4hSW0Fc3CHEw1xBI3qqPR2v
	7xwYExyK1VWYg69gKy6e0hRPR1bgE6Z9Go12p/7C6XM3+jpbU5YVmmibOfjiV422x7sB3QMLvRf
	ef6AhKTQ+Fw3pvvuLHjhOw5Yvp2oHoSOgttd7fq3rDi26U3LV9UL6OjIHS0kBx4TlXOH+knlRL3
	Bh0zvy/H+AYc/cQDjiGp38qb1dLOR6TCVAUsPwhyzdAOCl3gKf2P40oZze3B65+zyL8JdE79JlD
	0KcLeziD+
X-Received: by 2002:a05:6a20:43a3:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-2009f5bbad3mr20583409637.7.1743467176622;
        Mon, 31 Mar 2025 17:26:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx/aNjQmQG10wCwYwIB/c1wC1UJUayWNouRXjgmxojMWIKHkdkoMaR/aYPo2i9WrRTdbMBJw==
X-Received: by 2002:a05:6a20:43a3:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-2009f5bbad3mr20583378637.7.1743467176236;
        Mon, 31 Mar 2025 17:26:16 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b8b4141sm6952697a12.51.2025.03.31.17.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 17:26:15 -0700 (PDT)
Message-ID: <f5129046-4034-43db-8ca0-05b5c27e1d1e@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 17:26:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v14 0/4] wifi: ath12k: add 11d scan offload
 support and handle country code for WCN7850
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250327020527.1527-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250327020527.1527-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67eb32a9 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=hbj1clWKTLgvv7SpeOkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1R5wfdvsdCh1L5D-EMcJTWz2Tp9NkRVh
X-Proofpoint-GUID: 1R5wfdvsdCh1L5D-EMcJTWz2Tp9NkRVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_172619_022496_4E70B6DF 
X-CRM114-Status: GOOD (  18.02  )
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

On 3/26/2025 7:05 PM, Kang Yang wrote:
> This patch-set mainly does four things:
> 1. Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware.
> 2. Use WMI_SET_CURRENT_COUNTRY_CMDID to set country code for WCN7850.
> 3. Implement 11d scan offload, and update new channel list to firmware
> when 11d scan finished.
> 4. Store country code, and update it to firmware after device recovery.
> 
> With this patch-set, WCN7850 can do 11d offload scan and update country
> code to firmware successfully.
> 
> Note: This patch-set is an old patch-set in public review written by
> Wen Gong. Just resend it for him.
> Link: https://patchwork.kernel.org/project/linux-wireless/cover/20230914090746.23560-1-quic_wgong@quicinc.com/
> 
> v14: add branch tag.
> v13: rebase on tag: ath/main(ath-202503251458).
> v12:
>     1. add reviewed-by tag.
>     2. add branch tag.
>     3. rebase on tag: ath-202503172347.
> v11:
>     1. swap the order of patch #2 and #3.
>     2. rebase on tag:ath/main(ath-202502181756).
> v10: rebase on tag: ath/main(ath-202502111625).
> v9: update copy right in patch #1, #2, #3.
> v8: rebase on tag: ath/main(ath-202501172342).
> v7:
>     1. rebase on tag: ath/main(ath-202412191756).
>     2. rewrite commit message for patch#2.
> v6: rebase on tag: ath/main(ath-202410161539).
> v5: rebase on tag: ath/main(ath-202410111606).
> v4: rebase on tag: ath-202410072115.
> v3:
>     1. use wiphy::mtx lock instead of adding a new lock(patch#2).
>     2. rename struct according to wmi naming convention(patch#1, #2).
>     3. update copyright in reg.h
>     4. modifiy patch#3, #4 due to struct name change.
> v2: change per Jeff.
>     1. change alpha2 length from 3 to 2.
>     2. change wmi_11d_new_cc_ev to wmi_11d_new_cc_event.
> 
> Wen Gong (4):
>   wifi: ath12k: add configure country code for WCN7850
>   wifi: ath12k: use correct WMI command to set country code for WCN7850
>   wifi: ath12k: add 11d scan offload support
>   wifi: ath12k: store and send country code to firmware after recovery
> 
>  drivers/net/wireless/ath/ath12k/core.c |  34 ++++-
>  drivers/net/wireless/ath/ath12k/core.h |  17 +++
>  drivers/net/wireless/ath/ath12k/hw.c   |   6 +
>  drivers/net/wireless/ath/ath12k/hw.h   |   1 +
>  drivers/net/wireless/ath/ath12k/mac.c  | 167 ++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/mac.h  |   7 ++
>  drivers/net/wireless/ath/ath12k/reg.c  |  72 ++++++++---
>  drivers/net/wireless/ath/ath12k/reg.h  |   2 +-
>  drivers/net/wireless/ath/ath12k/wmi.c  | 158 ++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/wmi.h  |  38 ++++++
>  10 files changed, 480 insertions(+), 22 deletions(-)
> 
> 
> base-commit: 11cea2b6a2e3a5ddf3562314d1a378e7ea1c26eb

please rebase again, does not apply on ath-202503312147

Applying: wifi: ath12k: add configure country code for WCN7850
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/wmi.c
M       drivers/net/wireless/ath/ath12k/wmi.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
Applying: wifi: ath12k: use correct WMI command to set country code for WCN7850
Applying: wifi: ath12k: add 11d scan offload support
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.c
M       drivers/net/wireless/ath/ath12k/core.h
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/wmi.c
M       drivers/net/wireless/ath/ath12k/wmi.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/core.h
Auto-merging drivers/net/wireless/ath/ath12k/core.c
Recorded preimage for 'drivers/net/wireless/ath/ath12k/mac.c'
error: Failed to merge in the changes.
Patch failed at 0003 wifi: ath12k: add 11d scan offload support


