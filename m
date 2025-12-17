Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC25D66B82
	for <ath12k@archiver.kernel.org>; Wed, 17 Dec 2025 18:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=; b=thBS2POo8ynM4BaQWlP1/CIZOI
	BTy6yCunynbQo7y51d9rG4b/wDwwWuIoDzGdzN4fpmIxxxjMB6Nf5fwc8eTt75OlIeof9jxbPkcAF
	AfOHSJVoGcDRbwl11B0VH7DtguT+wJtax2EBkjRGKC0bTJg7HfHHDH3hg0+USc9dJo5m7eB5LI00E
	X/+uT9ymuX1FfsxZYwt9aCjiPdo5hszaL95TL3UMlZGKraaoSQjeIsmY7bWSnvdG5WwAcHh3R+7T0
	c1t+HsPESAZNgrRfAmBEhZa0knIQ8r2glQVSe+XlSyEf7BQwYTjNW1QAj5TaQFJDxcRvcpRI/Bl6Q
	DakrFQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVw6k-00000007G4h-1QDm;
	Wed, 17 Dec 2025 18:18:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVw6h-00000007G3z-2BEm
	for ath12k@lists.infradead.org;
	Wed, 17 Dec 2025 18:18:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKqo03000771
	for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 18:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=; b=XX0FTlGhGcl0GgQl
	ByTU7cTPlDPk/BXambHGMBBrAFNZaJfIcs6xA6ew4ZJ9tR7UJQS+gqePcy3CuHsP
	vAotqv37mohmAfVk+eAvIYj7rZG2V0YacO0NNdP0m9w3yE0WWFoEoPEvo6maf4xs
	6DWw+J4IIVBayH2jAWjYTnjijGyHuVPMpR0JkPMA9P0/h03K2SoFh/RKObvRsWpV
	eE00BccsGUxbyFdW7MIQrXSXW3cfy70VmIAoj7vErrMdAHU142riKXQR00XrVdgA
	bnC0PryPEaCZPZzqHVwAwn49yCO1jVtKSjP0r7hhODK19mvYysQxYak3xA0We1cb
	FKeYhQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n332pkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 18:18:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bc0de474d4eso12689715a12.0
        for <ath12k@lists.infradead.org>; Wed, 17 Dec 2025 10:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765995517; x=1766600317; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=;
        b=INuBH0ecSY9aIt4ywDoXhpBZEN8qqFC5fSL6ra929EWdbE8kmB3svRCgQHkxuwg9vD
         ieUhY5FKeAt2sA1GNXQVKX1D9t82C6wzacuYSUTBNeCE6tBjpIcbY5QgvPDdljc3YC09
         VB6P5wPBHdsIUOUFMqhhgvSXJ4VgMXUcN77eUCiIB7mMDso2lMys2PJq2y9qW5Phs2J7
         l9hXVIJMaNoUZPjGR6o5dkd72YJ2x6w/0/bSwC7e9nwvJxJ16C/iZb0VphB3qbtST/J9
         EEUtWJ1h7x/gP2b4ctf4xVaVJmfU4hrYmLLQJNFKBG/7eY7A4Q0cvUCJWlZ7bVO3ujsP
         Xhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765995517; x=1766600317;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=;
        b=BkpMkvYHIhCDm0hy83k8Ion7A89PdVK+YCMOUqFhZhZp36Gw3sRPBl5yDHeGupHZzb
         5M8RPvY5JHO37gXw96/jTt3E3QDWQA2ORD5JPspzaWzi+l9OoT9mmPZrSJOqRN+TKngc
         qkzFWaonEHdYTdMbsse3Jl71hTfum0hLXYWfVmxmbScm/7sy5gE1mouLIXmX4mlFqBnl
         PyOnDHofDU6TbPeUnq5ouqZJkbUPRCaMvyaxPNgfc3Oa9F4/UhEKbUmQgBq7DCTNNsat
         jH5NEaWzAP9YqU6JACxpy9cvwB9qkUdgzP/NTqZCHLeYSe7d8XotlpbMudHPU0Tq1eVG
         5BoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfAtPH4nP4ci45cxVKqrxd37OVaq/Nyb6oUhihvuFRUMhX8jr90caMLIr/zm9F2vw7XHpnnxo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMyiYP9c8iq2lio56eE80bqGj2lfN3SJtUgGjJMmu9hJe2nBD2
	F8Bk7OG4ykqzWKZqVqRlUOjZc27HhQyLnmq9ls8z7zq4IoFw7Hm19mAy5MkNpMn5s9ZM89OZlRV
	xCABivx8t/AG4GnY/sZRBqysswqKloyToOP6XMQvPTupB88Si2B0qVI5GM1foULKX
X-Gm-Gg: AY/fxX4SMSlaNxgRC5pep6NR3tf0/yIqwmqESxyd6MotzEVePvH/kVkbpTTw7fOKZaw
	za7au6Isi11M7oiNvdXr2qYpUmE3mEjN3VRMlZ6lDs7cMM4LiX8W41vglZOlnxOgCI9ZRAKjzG0
	VXTVhJT6iXFCSEJN/hk+kL6xHlwvVspLkZuRjyI2NqhmtdndyEJw5dZKw9rCtKTljJ9ciWQ9GKe
	nIOT2ebm6tSsBx24q2TREpUkr/orZOYr+AjpvL2AxSkwM6vS1Tvc4Mdn8rXKfgC4VkOyv47G5wo
	FSwC7mIUXWQeXdhbVYGuHZXdUZEvmdX8HNzmQfmnPcTl6qjBoyRDJykEW+hNo7vA5T0Zex/lbrL
	DFTHzTQRLLk0BYjazkwjFhgwpaXopoMKkcwxbyp9GLz2r82T7+Z6z8vmmNU3gcQ+1jBGymg==
X-Received: by 2002:a05:7301:182:b0:2a4:3592:cf83 with SMTP id 5a478bee46e88-2ac303958camr10594080eec.39.1765995517142;
        Wed, 17 Dec 2025 10:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6ScF6p2dbGaIAlfPTuofAf2/eZTtk6ONOKBGl/Qm27pAQp9ttnZa9kTtvsKTJrPW0AuH8SQ==
X-Received: by 2002:a05:7301:182:b0:2a4:3592:cf83 with SMTP id 5a478bee46e88-2ac303958camr10594041eec.39.1765995516561;
        Wed, 17 Dec 2025 10:18:36 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061a93616sm517453c88.14.2025.12.17.10.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 10:18:36 -0800 (PST)
Message-ID: <5e568034-20a3-4ed5-a8e0-c010e5aa7b82@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:18:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR
 DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
References: <20251217-qrtr-fix-v1-0-f6142a3ec9d8@oss.qualcomm.com>
 <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDE0NSBTYWx0ZWRfX2NQyfWxONadE
 afFrGO5fImnq5wfEG6NtcaPIFHkC0RNVF9r1p4w9cwv9kuuEENSwIihrVXUyJNy28fwGJEd1nSP
 23jVQ5nnZ/YqyHuIlJg7xjhK5EljtRHIAE+f4B5QnO2CkK9eQxtA3Zc845TFJPwXUqZvw3RR21a
 Zhbq9/j5ywQkwf0hAp6Wrc6h6/zeNCYaVOOTWTD0JVD93iRGr+tgx0silBECg/WcPsFKoM8sSe/
 ex+znzPbMexJJkZAsMg1rUB52nv05DKORaiK5rJ/6js/pCgg7OW3ILkw/Aq2zJdFGQMZuRSKOd2
 a9usAY/U6wiM/PgbZUFB5G3qrw7xwV0gsBFbuPKim2HwIZLbIC3hU7Xw3l0lBMlCLP06LG/66B9
 CP4xAWTX0NJode+96BMrabOOed97xg==
X-Proofpoint-GUID: 2IggdaFQZ9Tsc0J2UBX4xEh4K4cmnPBI
X-Proofpoint-ORIG-GUID: 2IggdaFQZ9Tsc0J2UBX4xEh4K4cmnPBI
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=6942f3fe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_101839_668540_6457E07C 
X-CRM114-Status: GOOD (  16.44  )
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

On 12/17/2025 9:16 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Cc: stable@vger.kernel.org
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...


