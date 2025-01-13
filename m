Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941A6C02180
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4JA/i7/OC4FxbT9AIYXFyIoNZebbdXPnSVbrB10s24=; b=yrbslk8b4ETbnW5ScYPXwZpGer
	qf7r+0fIZCFmonJrViBV5ERvadh2ulSo8lQ/Eh9Kru2Xil8aV8oJLk1AYb7FUvPmpUBvaM+5S6YFn
	LA3Y7sCjULqDH+jWrdulS+DVPG3R0S3fvS7q6shC/X54ehNYfIZcCmR45SlPZRmmEKYht2q4I5r3N
	rNvI1koRpVwd7SmuB4ZsY9UBL4wSuiUnqcaNaDLkKtYMN8mJTDUHkAnjSe7DMmgjF/77PnfY8LzTm
	urNYxD3WXcWGoZ4aW08panR4eoGzAUaTuGp2AIi0eOG3zDjUJ/63dev9bE2ok088MgqzX8n/cf+Sn
	D+7Nf/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ8K-00000006NyB-1VeN
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:29:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ7k-00000006Noo-3YhY
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:29:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DC0fV0000345
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X4JA/i7/OC4FxbT9AIYXFyIoNZebbdXPnSVbrB10s24=; b=knolYIyAmcgG/XkN
	Lo8dbWI5XdN7Tzx8QUy6Xe21PnRoZmgOB1vybELiG5sSgDHcBmzcoYyPHhVYPLlx
	3hJJRKowRLgl8Y/3gaZmL3Kd8NrfmA2R3QyZA5k+r/uau5a3TH3PXm/PiLLLlpsy
	NAQ/SdeAsyaeJdv1A6Fhox4ra7YiJS89D2M7siCx+Qu22W8+TUjt6FzcpL/agZ3i
	hMQXXDzYG+T0CgfqwlDi5E9U04fPoh8J9r1yY63Vhs/5Cjv+4lHYyUtQlAomOxre
	Q7iKUXTST9pQd1ye2723VHOybnPlhfasht0Rr6PCKrwZX1cDC3vH+cnmWrWQdCg7
	1VVQRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4452f9155a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:29:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so12145274a91.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796558; x=1737401358;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4JA/i7/OC4FxbT9AIYXFyIoNZebbdXPnSVbrB10s24=;
        b=QG/s13Jj6CYk8kjcerfZY8crTr6G1xDeut2KJ5sfl0pqw+RHPCNqRwdO5ZWc/88qIp
         IU1/zDEFnat4qQkoQ0MsAz0d0WtBPCKdJXO5fM4L2KzieREB81ig8+RSY5Q9bbtsbLw0
         XwB3nkhZJIL8j2ynnaGwjWuOiYXwfb9V4kt8Jkm9MlNOVxfwY4mgc+QSVl1U2BhUtzms
         O/uhQJ3utBvjdMcJluQr6xEj04reF54+Y5nBpGkaGiY6R0gHAFpOFtfoGGatLKf+S17u
         uJX0uwxF7hYT7xNOISwiWjs+cRJFNqTt/owrPLIhanh9spNo0Madn+ne+lmqLExI4qwu
         /9aA==
X-Forwarded-Encrypted: i=1; AJvYcCU5CkW0SChFhJD6vNWC/Luhbth5YAg2pagdYgaqSnhzpe2z+U7OGO16iWcxQbk6rt/QFoFd1vQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZyk8OJ8vPTbm3Mk3AD/YZB4gKusjwnHzXWtQKRHEewxCU1siN
	548GD1ysLKPFa1njSgRU1W5PhomrJHfD5w13ui0jvRSJnvxiMHTAXgQIG1OGNNw9gsT3w/kbhos
	mPNcM4L9SscLFulyNZIs/omVKn3NMm5vg8YJx2e12uVtN8zM/66obEed4DwJg
X-Gm-Gg: ASbGncu58TNP0GcHhpVRHPftdwIwhKOipqmJ2WYyicLWdJQSd8B/5I5kuhHVnnalU09
	jEWhmqt5DVeM7jRurVazj/j0G95YSNbBiaGmicruqOzr0ig0lm9+hTrtO44FjiVjl/rFoZsw/EX
	ZSglDscu0Ls8lNt5AnGr6YtuvfPdmrLmZs0F5Y7tsULI4JX5TQ1KMvtILmhZMCB678Hp+BOpmxO
	DEkdXtAhH69oaYAnmtCoh9+QUTrRM36uBBBamnYzY22soJ8abj6ZaZlT5LA6lMu3/GSyLW9MyOf
	UM8JagApBkefaWKxvcCnqOKrYsIuR3aAG0NizKXH6KvheZGuvQ==
X-Received: by 2002:a05:6a00:340c:b0:725:e015:908d with SMTP id d2e1a72fcca58-72d21f459b9mr28226072b3a.1.1736796558507;
        Mon, 13 Jan 2025 11:29:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlppUWigIhRpncUzBzvJ8sBlojPnSz1ng0GTzw+hkyEacaIw8rHWiKXyR2SM9P0KWeHLPaJA==
X-Received: by 2002:a05:6a00:340c:b0:725:e015:908d with SMTP id d2e1a72fcca58-72d21f459b9mr28226042b3a.1.1736796558127;
        Mon, 13 Jan 2025 11:29:18 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4067f84csm6391821b3a.142.2025.01.13.11.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:29:17 -0800 (PST)
Message-ID: <b5cbc224-8a6b-4c14-a268-09f71b8aa04a@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:29:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Add support for MLO Multicast handling
 in driver
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250109184932.1593157-1-quic_bmahalin@quicinc.com>
 <20250109184932.1593157-3-quic_bmahalin@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109184932.1593157-3-quic_bmahalin@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -EOYr_4OPeXrPE6BDi3m9cJcAW4QGI4W
X-Proofpoint-GUID: -EOYr_4OPeXrPE6BDi3m9cJcAW4QGI4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=746 malwarescore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_112921_013329_E0EA472B 
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

On 1/9/2025 10:49 AM, Balamurugan Mahalingam wrote:
> For MLO netdevice, the broadcast frame should be transmitted with the
> same sequence number on all the links.
> 
> Per IEEE 802.11be-2024 section 10.3.2.14.2 "Transmitter requirements",
> An AP MLD shall use SNS11 in Table 10-5 (Transmitter sequence number
> spaces) maintained by the MLD to determine the sequence number of a
> group addressed data frame that is transmitted by an AP affiliated
> with the AP MLD so that the same group addressed Data frame
> transmitted over multiple links by the AP MLD uses the same
> sequence number for transmission on each link.
> 
> Currently the MLO multicast handling is done in the mac80211 layer.
> Enable support for handling MLO Multicast in the driver to update the
> hardware descriptors in a custom way to handle the multicast frames.
> Firmware expects the MLO multicast frames to the submitted to the
> hardware with special vdev_id (actual vdev_id + 128) to recognize it as
> a host inspected frame to avoid using the reinjected path and it also
> uses the multicast global sequence number (GSN) provided by the host
> in the HTT metadata to process and transmit it with the same sequence
> number.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



