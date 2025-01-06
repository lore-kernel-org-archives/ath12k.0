Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CB2E77188
	for <ath12k@archiver.kernel.org>; Mon,  6 Jan 2025 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hS9Maw2Z0ShcNN0wei4njY2d+bdWScClXXVFjbcn2Q=; b=H+KpT32nlNXT3W+jUpQxUkVWUO
	Vnxk2o+bxmP/mmSh8aX60/vMO9VDa+AJxoOsTGRtegIf539uWMc2/GDWRwpmcYnHwcoop+7NXyeZB
	oFT2d+kErY+QgMcKvXVcFmiGv7d8sQCvWorny3UaZRwQeoQRobtkHULdXHUfktQZGQ2V1dxPtcJdi
	H/DKP4/6dszSpnM0UUL8bQJLXziOC3rOzHu8Frb05/ynLCfTWBiUnueA2bStjB3vtF9naMcYfUsBb
	UYOrGYY4daALjdujqkoQiqX3J1BLY189D7yPbk8eMe2b/pZAIBvOrNgh6SY11cnnc4Xo5zm+RZBMf
	9sL9jCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtzp-00000002dCf-3Emq
	for ath12k@archiver.kernel.org;
	Mon, 06 Jan 2025 20:46:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUtzm-00000002dC0-3ylq
	for ath12k@lists.infradead.org;
	Mon, 06 Jan 2025 20:46:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506GKTI5025662
	for <ath12k@lists.infradead.org>; Mon, 6 Jan 2025 20:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hS9Maw2Z0ShcNN0wei4njY2d+bdWScClXXVFjbcn2Q=; b=OmfKfTzXS3yBqL/+
	sCOyG0+yei45Tbvl6XRqB6QfEXpBQ0526isAxxh9DdSNhm7fvRo453pD7TBg4buK
	556UMnC1daNksGHE1WI2OdBH5146PJ92Mq79vo31rHI9saynj8+xc8ufXuhBoX3Y
	JwNIc9j+exWUaklQyJ4NH2cDI4XN5boZ7cZR1WjENRJIVDHWr8Mxb2G4mV8TamVy
	CJ8A6Ee+EyqzIA91HWY2d0BY6hxLpRfSWIh+9zRnSIG9YTzu4VcwB9RU67r1AKc5
	PZnY0fh4y0XFDLODbCfZb2yJemq2CVbYEb8nJgbkVa9DwUTOo4/tiDVzJDFV58Ac
	DQsyFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440jm20hrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 06 Jan 2025 20:46:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so20788341a91.2
        for <ath12k@lists.infradead.org>; Mon, 06 Jan 2025 12:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196400; x=1736801200;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hS9Maw2Z0ShcNN0wei4njY2d+bdWScClXXVFjbcn2Q=;
        b=g/eoq9IyqFWWvtrqyb0xAH86C7WsLwH5EqjcUj8uFmo4cIYKXZ8siG2/FxLDlwx1Wp
         n8ari/9jIP4JqGcenCEfyGIKFPGz42vWWdkpxP+If80pO8zmY4C30PGvQboj1Tbfl9i2
         hHckNnPyYoPHZVlVu72blvqP6Kqou+qL+QLkZHlCQzwou3wfr6+y1ZjKAHuFyT1sQKQ2
         2bpk+kBZB+UyT0HS48nCVYFDPX83+IodWnh5/VaOqV8jOGUVAtSqbaNG8EY+VloEq3q0
         t4xCxXeIK8wQxa+HpvJ0SnWQu+t+f0VHy62tOQ67YNdkXfJPL5jW9j90KMD9oU66fVBI
         gi8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvtiwC2XsxNiQA8+UFE9UnmEPf0oOlh/BhQE2a+06LTgIl1KnjknJn6Bem/xzyoCxDBV5d+js=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/B0vhn7ZU55uXo0HgLvH0TjBQisLRzZTVdrj7tToKT+1vmZCV
	/9zYgQQhTFcq1kUT1xE3EQ5KpU0ge2uXHMxrf1t0V91fy8vH6j0y7SIKebHe6k8K+z0yMFFzpAz
	AnPHC5SnG48w+R6CDfDKHkVOYBvr2TItxnKBsMdGP3EMvup29Qhmrkc1uRKXPJooyOk01
X-Gm-Gg: ASbGncuVd+hX8Xt4dq2bObm+WKq+PGtdgdhWVk8OGezAsakZ92ErcmY3X2BLh7CA7xm
	fSNrVR0+vPuoWJijzYQgo3s5I1nt/shlsXSICcvRrfov0BK9FwwCzer+LP6BFKEB71a2Pe0Kg4A
	Zgx3PosftIEPc64cQAQRjKYgRizhIGXT70GvH8YCVQEw2lR9Wk3iYo0UJTo0BFcwtkrTZiLV73X
	0Nwo8mUG8sVdSOW22ggcJJ8XZnRqPde3D/VOQvBQ+QH2420sgklaB2QP/d7g8lxcsYRMPC5kqzH
	62sK59THhJQbh0LmX2rpNhu6aoA5knqYKnv7dRrRt4WgzhNSSg==
X-Received: by 2002:a17:90b:3ccc:b0:2ef:3192:d280 with SMTP id 98e67ed59e1d1-2f452dfaed8mr92842112a91.5.1736196400234;
        Mon, 06 Jan 2025 12:46:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdfVgLqPHCEq0Lx4bCm4Z5GRr0qnXbVKc8tgH9PUIdQzSB4np7W5kFTCbiKwai67JtiIhowQ==
X-Received: by 2002:a17:90b:3ccc:b0:2ef:3192:d280 with SMTP id 98e67ed59e1d1-2f452dfaed8mr92842094a91.5.1736196399831;
        Mon, 06 Jan 2025 12:46:39 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882d11sm34481806a91.39.2025.01.06.12.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 12:46:39 -0800 (PST)
Message-ID: <7721a8cc-ee42-4b6a-a08e-ed2ec472041f@oss.qualcomm.com>
Date: Mon, 6 Jan 2025 12:46:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] wifi: ath12k: Support Sounding, Latency, Trigger,
 FSE stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241224102013.1530055-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241224102013.1530055-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rGDuaZTqitH8cSQe29yH95SSH7WgEOTm
X-Proofpoint-ORIG-GUID: rGDuaZTqitH8cSQe29yH95SSH7WgEOTm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_124642_997574_6BCC34EA 
X-CRM114-Status: GOOD (  11.91  )
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

On 12/24/2024 2:20 AM, Roopni Devanathan wrote:
> Add support to request HTT stats type 22, 25, 26, 27 and 28 from
> firmware. These stats give sounding stats, latency stats, trigger stats
> for uplink OFDMA and MUMIMO and FSE stats, respectively.
> 
> Depends-on:
> [PATCH 0/2] wifi: ath12k: Support Rate and OFDMA Stats
> Link: https://lore.kernel.org/all/20241128110949.3672364-1-quic_rdevanat@quicinc.com/
> 
> [PATCH v4 0/2] wifi: ath12k: Support AST and Puncture Stats
> Link: https://lore.kernel.org/all/20241217055408.1293764-1-quic_rdevanat@quicinc.com/
> 
> v2:
>  - Added line breaks where necessary, as pointed out by Kalle.
>  - Modified the use of pointer arithmetic print_array_to_buf_s8().
>  - Modified commit logs, as suggested by Kalle. 
> 
> Dinesh Karthikeyan (5):
>   wifi: ath12k: Support Sounding Stats
>   wifi: ath12k: Support Latency Stats
>   wifi: ath12k: Support Uplink OFDMA Trigger Stats
>   wifi: ath12k: Support Uplink MUMIMO Trigger Stats
>   wifi: ath12k: Support Received FSE Stats
> 
> Roopni Devanathan (1):
>   wifi: ath12k: Add API to print s8 arrays in HTT stats
> 
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 736 ++++++++++++++++++
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 267 ++++++-
>  2 files changed, 970 insertions(+), 33 deletions(-)
> 
> 
> base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
> prerequisite-patch-id: c30df5e4af6f5773ed942d8f78de88c05ce2b18b
> prerequisite-patch-id: f2181eee4bce2e3487db9bd81ed962f477759e7e

FYI this is not applying to my test tree. Strangely, you list two 2-patch
dependencies but only have 2 prerequisite-patch-ids instead of 4.

I now have both "Rate and OFDMA Stats" and "AST and Puncture Stats" in the
pending branch. Look for those to be merged, and then rebase on the main
branch at that time.

/jeff

