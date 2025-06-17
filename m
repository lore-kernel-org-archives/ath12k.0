Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95963C7115F
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7OGmGpdvF+qEviVeVrWV/kac47I6U3U5/16oRtFhks=; b=KC/cGWMijUC9k81bU7cxcFhl/M
	bZxcc6N2pG39LfQRX1G65Gv7QRFU9SIqWLxFJ9UZWQNMCjYzS/qkIu6K9hMss04d581zaOA7eXfKK
	1fRXcCbG5hCWwNDOs91andWw6L9a6YJdt80joiFKdH03cOxDrXc/WEOamN2/6JFFToyrC5nm+1dme
	scrLQOTVu148trh74SpmykBWrf6SgzC7ZdQz3FyFoqJFnz0wdoewAIk5hiOc7TKerKw9R3WOsRij1
	i+j5XkFtMrpvD9mVfE37S4qxgJpps1tDgRcKeY3zVtQFE6nXvJ05wi7xjR/ynSsQlZWSnF9hQIJJV
	O7wUz+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrr-000000080k2-1AMT;
	Tue, 17 Jun 2025 17:13:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZKS-00000007tlq-0f2D
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 16:38:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HD92R6026338
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 16:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+7OGmGpdvF+qEviVeVrWV/kac47I6U3U5/16oRtFhks=; b=nYz01sqBmekgo1M6
	yJn5/qrHHI9mpTrtoZq09qPOSYd/mCQ134McU6bzpzExB0z1rwcx46DMr5DIFH0D
	FtcVyfK4kNBdN+bvohUB9p/IuNayvAMYZPm3YR7u8KJBjQh6ND/O7yOjRxnaQ+uY
	ylyCJGYHc3n0LBkeElBgacnFMwAtNDhHlSvd7Q13TGC9ZoY8wCYqko31gNwKLo1H
	47smMC9D/430N8AyJCkwkYRcLSn8OVnQhcpCueChS3u6rhWMb8nTkUc0Zf3bPP//
	0AKmqla1pjnmNAvmRZcV6XgdOfV/j4eFuZ9hgS28IFZ8d0Vn7fs9T1gt9a3RUNuJ
	8QDCtA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfh5fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 16:38:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748764d84feso8086612b3a.2
        for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 09:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750178310; x=1750783110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7OGmGpdvF+qEviVeVrWV/kac47I6U3U5/16oRtFhks=;
        b=aNb5FM8NeNW5nr9QkdCt7hnlYfF/zHlzfaGyAYiMrGNraVpo9fuJ/9jH5bFbZ1PMOO
         P1YjagZSKGd/DmLjAlencvk8fo7Du7Cd2PzutMb40MSe9ma4eFDHrBIVjhLkQSkNHqe8
         ffxWgHmXFx2VFT4n3zQS3f3LlJ87zT/C3fqhEM0XGoUnYAaQGoOERdBJOGZCzfM8c+Hh
         LjLk1qo+1L8dBQc5GOs1FOPrc8jvq/bohWIMffWrnSilnFx9s5ouxP36wYhpETLGV+OY
         KvNplZsl4gsB0nm1bddxu0pKSP+uBKOtawRU0kH5x0CVBlcNRrgHQG7EO04CuVI+siaT
         oVAw==
X-Gm-Message-State: AOJu0YwwcUK0hiSEtxzGNtJTGJwwn9fiNTpPKFR5EPN2eQg4aoMaWbhn
	0HQyPJ4Z+GFc6JaGbbAVWRzpmq2P7wmtVdD8/y18hcj0qYoE2S8y6rQv+ejSHYIY5RRpjydVS3c
	+Zfi7aVfYcZLyt9GvYsY+DxnHQ2SFU2AQ9dtFx/JCbimfYaMSiVmvq8wxd+5tNKFW0fZhi5lo
X-Gm-Gg: ASbGncvPVU2ZXR2NPCcqPXs35ep0i6cQMnZNYkoJD9ofimh+GoEirCjoekcb7i0X0mt
	QyiUyJbju+UFEIbwsni9iCPAC/qnySnM55APYWsmSYQC92cV+xB7Z3vyE32plSiaCmxnYatmWIn
	ZIf/GZ6P94QLRQqOhpScJnHbzYLdEpilGczsKj2g6LQXeuty6bW4aBObpDK0zPR2NK6ZwcXTpFO
	GYgrWTv4CZclHLq809MfEgbANIktxgVSha1uD2lsH4IwfXtdQ0xPeXTpYiuuhZEW9XVDwo5vTfx
	ulcyUDgd2IoBS/3pucVuTYWRZwRaqH4QfhzdgwdiU4lN8U3qDKicvJyZXKhkqzyyASlimbGZGae
	7jVB6FJ3wRdlYnfg=
X-Received: by 2002:a05:6a00:14cd:b0:748:4652:bff4 with SMTP id d2e1a72fcca58-7489cfcb16amr18730440b3a.13.1750178310060;
        Tue, 17 Jun 2025 09:38:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2hu6ziKMb+46PhKkOTmrCbrON41+eSFTPnodVUx4lLRh4ASU8DKdDm3GLLpountd7Hx8Hrw==
X-Received: by 2002:a05:6a00:14cd:b0:748:4652:bff4 with SMTP id d2e1a72fcca58-7489cfcb16amr18730343b3a.13.1750178309523;
        Tue, 17 Jun 2025 09:38:29 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900074f1sm9388829b3a.67.2025.06.17.09.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 09:38:29 -0700 (PDT)
Message-ID: <527e2914-abd2-44cb-b2b1-5a6ed2792fc1@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 09:38:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Add support for transmit histogram
 stats
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250617042141.215540-1-quic_rdevanat@quicinc.com>
 <0c226bfb-6e0e-4569-89a1-9450cdc038d5@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <0c226bfb-6e0e-4569-89a1-9450cdc038d5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEzMSBTYWx0ZWRfX2PA+oZeRSTTm
 glnsw6O1ML7YgaoxLZGop9VUwjEE6H977jHzN3mNCkq4xDPzgfFwG0Utt8cAp23qUOoCn96gEQG
 pvSD3/t19Kz6guaZEHO3SplNMVzXwmU/TI3vDUEx2kvTl3xcrTxIgUjKZYlQcR/2dDPE+PUhrIp
 sf3aRwPkabLoJUsNOk9TnQ7XarUYYO+h4VCgiaqp2j37bclhFohs0wlsmmsLs0eQqY/d3+8dZOa
 A0/t5Fc8f/sug8gDOaOmc7mEHXJ6UO/mj1Nlwqxn7l/gcpnxoNseSIeZ/wCflb/5CyAsioL4BpO
 s2k6QZ587tDPFToTgrkAYomQdbOHILpZt+8F9fGciKsvPNi8P1Kx31g59AhwE/YQ+xv4GJFMLZF
 VEcPZ6Ig3CqhMbnYDNrsosVp0yshysEWhjmiqCXFlHt/7L3xqCI/D1rK7rriVbipg2lcMb15
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68519a07 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=fErHcR0BBo8NarzEaYoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: sG6wsRP8KkspICYmWkTMKhs8WDV2_PYh
X-Proofpoint-ORIG-GUID: sG6wsRP8KkspICYmWkTMKhs8WDV2_PYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=779
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_093832_232193_81E3BA9D 
X-CRM114-Status: UNSURE (   9.98  )
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

On 6/17/2025 4:15 AM, Roopni Devanathan wrote:
>> +static inline void
> 
> Please kindly ignore this patch, as there is 'inline' keyword usage in function
> definition. It is caught by wifibot and reported as error. I'll post a v2 of
> this patch with 'inline' keyword removed.

I've updated my workflow to check for this as well

