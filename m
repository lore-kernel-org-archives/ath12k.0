Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F4BC36005
	for <ath12k@archiver.kernel.org>; Fri, 21 Mar 2025 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQ+EQ5JGQ/p3NSEWSaxtIU/HftXFPwlWY/6AZof8vvA=; b=3To1U/t0x5LQyiCkiUiLF+QgUZ
	RokfCW7INneiHoD7S1wALLGUNHTt1m4f/Q5JE3zluqnky0PGyBLhkBPauQa7ECkbiAE3acvYDtPy/
	SzesWHu2izhGxgJMcYuKyUUrOJhjfZzRKmVWccG8K/xKwi+wM1WogdCkEsETs2G3TSHOOYW9U1qMc
	jbpC80ljYWmUESat5I2MiupQ5ZZzpqHuL3ugPtXbZqipY0O975FANjJoLUxJ7ynAwnSjRU8sH1q0B
	gwDSLKUFvORMg9JnZEpPi6ncih8ml5AeZko1V2YYxROmQ9p8WatdruahNxXBvmVCY0M7EElpcqDfu
	WLxNlJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfIq-0000000FWB0-49NZ
	for ath12k@archiver.kernel.org;
	Fri, 21 Mar 2025 16:33:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvfHC-0000000FVnF-20Jv
	for ath12k@lists.infradead.org;
	Fri, 21 Mar 2025 16:31:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATLR2016745
	for <ath12k@lists.infradead.org>; Fri, 21 Mar 2025 16:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQ+EQ5JGQ/p3NSEWSaxtIU/HftXFPwlWY/6AZof8vvA=; b=LpQ8sILjllXrzXkB
	Ycfm98+ptIVH8dh0c5/x0khSiWKpeKQOftDjH1Sc2QVdINtGmdt02zndLn6KtTKj
	bsCwXjVIqM8Pny+qYwZGc1+UixIP7cw4WA+nEIvcfFUWBMKBNPZy15KVtfrm5krY
	jgXBW78KyDPMj1OjZuyuTcFOOxbr6C+Rqar+Lh8gCBMcjuupv42jFCaVLY9S4fmD
	/KMtgJiImCu1xE+qFa70ZIT77TQxWl+153rgLDYo5hh27l/XVkgy0+2H32uyW7xQ
	qc9TwaNKzebqs2l36TmE74LmqpzRICRl9pR5kI9CNfZsBh8TvedTSy58dmxzftiE
	tcIKBg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd1df5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 21 Mar 2025 16:31:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-300fefb8e25so3764742a91.3
        for <ath12k@lists.infradead.org>; Fri, 21 Mar 2025 09:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574676; x=1743179476;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ+EQ5JGQ/p3NSEWSaxtIU/HftXFPwlWY/6AZof8vvA=;
        b=bAK75rqe1y0wBQHXW4l9JMl0WYu4kZntoyCxJCUS3vUPT/B92xXz/TW0egbqqsqCKP
         7tmCWYrTF51K2mFVI6xLV6fxhrVNphKx4WGhOOYzvazfMDh8iHMntkViU8iyVxcAO4Jk
         V4FuQ1iX0p5CACwh6grrxPd8NpLJ26jt6MSadKOM1a0/zq6PDazfbZCjCs2jbx3fgOsI
         ozeEd9xQtJGUWYsQs/niDb3IW8gzW2tOFvA5qKDY6bcZGxg//2sveFQ/XlPHZ4jntrzD
         3ySb1ydlTxSmAZC4Ai+FyMLqS1AxNdhyFe8gy79RZ+QAwDkbrAqtWSQ+C+qjdmiH/igM
         SVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUeb/zRgEwnRw0zZxjnLidIfk6PUjxG7VAUEbdRkZqRCOvhcaq7OecIuTHc2gC9MCT9S/o+60=@lists.infradead.org
X-Gm-Message-State: AOJu0YxshK8kc2qVQwHt7MMyTqA7+3PDzmw5Ru4xyEkcVyAbyNVJSasq
	dluPPboEqjqtVVuxHuTPEooQ7nB0fWG/rqowh0bGQItT+CA0lksmzU1k4Fsjy6U0ui9ZTwlXy4p
	o8bnW4InECSCcZwWvaWxCtp2pYpWJoFD1NnH6Y/GgY+FOv6563nFsfCyzQtxjlyzgZkyx
X-Gm-Gg: ASbGncs+hMP3QszAgs3O0mnbZ9r1WCqO5wwbzPG/U+fwXoDYfUfyAekspw7i9f7Mlar
	ET+ugUeeRo3Z9jlxGi3c+xTDmurhLrAHrZG/8HJnNHqItj+Qkdg76RN7XNoMTGlsmf47krRLyBD
	QjAvBK3ebB5bBBuCVXJHm26iAMOXUYv6wht9iWCspgivelGjtKiDNZUc3qmQBjjXiX04fwoclgH
	w0t3SNxbeQXgKGWWwSgc/zaV5EvYJHqrxrfm25IbCwQ/faFLTKQTE84gR4QAtVgyoyJ0w6vZtiA
	HlLrk+N1b26+2Xte2QFIi/ZsSHoXQJ/BO9uTN0qnlGHwqINQ7r0z/Bm/CeZRqE5ytj/x5sioUn8
	JkAqgq+xv
X-Received: by 2002:a05:6a20:d81b:b0:1f5:93cd:59b5 with SMTP id adf61e73a8af0-1fe43327edbmr7689398637.28.1742574675871;
        Fri, 21 Mar 2025 09:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiuQMISl1eN9RX+Es821Eblup8CDwjYoGKpMH5CGlq8b1HHOajXsiimxB0ELiPyxoSm0dayA==
X-Received: by 2002:a05:6a20:d81b:b0:1f5:93cd:59b5 with SMTP id adf61e73a8af0-1fe43327edbmr7689338637.28.1742574675301;
        Fri, 21 Mar 2025 09:31:15 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4d016sm1690127a12.69.2025.03.21.09.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 09:31:14 -0700 (PDT)
Message-ID: <89db5e91-2162-4724-bdf1-238f84bca8a6@oss.qualcomm.com>
Date: Fri, 21 Mar 2025 09:31:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: don't put ieee80211_chanctx_conf
 struct in ath12k_link_vif
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20250321-ath12k-dont-put-chanctx-in-arvif-v1-1-c8e93061952b@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250321-ath12k-dont-put-chanctx-in-arvif-v1-1-c8e93061952b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dd9455 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=uvMg_fejPkrpZwH_nmEA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 28afguPRmJ4ri_IF8r5cSNDlrG_akUTm
X-Proofpoint-ORIG-GUID: 28afguPRmJ4ri_IF8r5cSNDlrG_akUTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=957
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_093118_644424_D97B49C1 
X-CRM114-Status: GOOD (  13.31  )
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

On 3/20/2025 6:45 PM, Baochen Qiang wrote:
> ieee80211_chanctx_conf struct is not put at the end of ath12k_link_vif.
> Note ieee80211_chanctx_conf has flexible array member inside it, causing
> below warning with GCC-14:
> 
> drivers/net/wireless/ath/ath12k/core.h:298:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Although there is no issue for now since the array is not getting used,
> this should be fixed to avoid any potential data corruption issue in the
> future.
> 
> Remove this struct from ath12k_link_vif, fetch it from ieee80211_bss_conf
> instead when needed.
> 
> This change only applies to WCN7850, and should has no impact on other
> chipsets.
> 
> This is an alternative to the solution proposed in [1].
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Reported-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Link: https://msgid.link/Z8-Snz86Xfwdlyd7@kspp # [1]

I'll change this to Closes: in pending to address checkpatch:
WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report


