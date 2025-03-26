Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12874C36008
	for <ath12k@archiver.kernel.org>; Wed, 26 Mar 2025 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=faRdspgYwzNPUBRC1MsrViHX8yDM7tqPfymKZ9E42yM=; b=A+CzkoCV4sc7C1UZnV/dRVRVUK
	KG9tXMFa3xCaUwyGx0o+7xwvz93j/GtJqKiEFIB29xCi5kgcdczXJGfpTMFkvKxVyNYA1omKfQ19O
	dHhR2WiCPVNBOSFPpffR8eXWdk8JkfI38SMAK5f+E5Hp9YysgQowXrx7cc8zIv8Div9HRa2iyuHnA
	QAiuFSz8L0Z2arq0BHC+tq5cFu/ZXm8sJYG3U6xkjWpSochH8Z5SWMZc3HJOW8+/h2Yefh5VzcTDv
	b9rTPUTdOQp77kRlKj8ISnFApXP4uClPbKovq3Cbqv4zN5t8fxI+PJqI545KxlgT6qvoqkKYWWddz
	4pzdA1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSb2-00000008qGs-3SF6
	for ath12k@archiver.kernel.org;
	Wed, 26 Mar 2025 15:23:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSPV-00000008oDZ-0seA
	for ath12k@lists.infradead.org;
	Wed, 26 Mar 2025 15:11:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QEorFh004065
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 15:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	faRdspgYwzNPUBRC1MsrViHX8yDM7tqPfymKZ9E42yM=; b=WSLLPe4lZpCUWClN
	ur1YDs8noWh8CR+Hgz9H1bOhdfDN1PDeKZoL+pBgak9WSS4E4k2ioWuvDT7ybb1q
	UOBrafs18Lp2cPQbjQsi5GYCXuaGpywq/lI+U9jTCOso4HR4cCqtboIHO8sYjIW3
	Mfo/bCGZovQvZU42tzCr57Bb4scDK/OfleHtS6NaT2nD6gOOpv2oWhhx7RD3GIPi
	vvuL4RHTt8XfczE+YdHP4lYCnr1TDreX4eJRsV9TJ5rfT24wAmYsM8yvG1yzdL0x
	n7ab78cTCGqI0fvHkpVp/7jvv5ukM6BY48v5RUNndxWmwzgnEiOv1PZSi+bLD9wL
	lqV4AQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcydem0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 15:11:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22651aca434so120166165ad.1
        for <ath12k@lists.infradead.org>; Wed, 26 Mar 2025 08:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743001875; x=1743606675;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faRdspgYwzNPUBRC1MsrViHX8yDM7tqPfymKZ9E42yM=;
        b=DP0vJ+21ao/KUqOkHdW7h1bE0rzN4n+DEwHBdGD36mYKSoSdKMDRbq/ge2cDlXUFxY
         ntyAjDsmH3uEv66AH821JjiidvuIIPuFxF+KhJJ5SxKWYwauJskrGqJmEjEpMGWlOBTU
         jCJnfkyR3KjjCQqTymAdkPR+Mp74yz5NWzQACd7W6YltI9w9FUcYkkKdfwdqKUhF0sxt
         xu8Oyay+sWE3Um8Vf517849Na7e+P8amPZYnnyxac5Oi9fmCySmc8ejebP4eejgnUSN+
         L5rklF6mNmCvnAFk9BT3ATBGFaiBXE11wXqnOnw93RQTpjMu6Bj4s5CRHUACuTWEyWxh
         OZxw==
X-Forwarded-Encrypted: i=1; AJvYcCU+poeCGHz3Bw+nstWucArNgZKwtrnfIbqqAVOSiklHz3Uxx7n3rRNVEz4EQzA+arMWq5b9zW8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzit3GKOjrwTUNlhdAAl8jkoYQNZ6HjKNtw93uNRJtwE/nbuVBl
	NYDgr0LWvZ+JRmHs+HHf3jKCemvfwQjH+nBdv3yQ+p538ScmfSZ7OsS2HdhadbrImCqrXkKh4vX
	oo4VXC+c3ENLIZGMNv9IO2bx6oXO0cbEEryJt6t7jVzHhwli9AllF6yGSRqwh
X-Gm-Gg: ASbGncsT6pV334V3k9iFyVxEkzgrY7MQ9kk5Qc1XbtEwN8QzrIPwaeCkYD1QOC5IZhJ
	KhLb7OuJ+Al5xbDSRwFXJjnu4QvWvwy7oe4u6ZPDsI8AAA7DjRr27qCvWQQbXQoYtOu/VS8McnK
	Ox3mBJymY8aThZ0OaGDOrShGi8EawXiBEpjJnBaQHnpSagWIJlwLuIr7IdKh5/51ogSEdkm7GGJ
	6atBc8q4j0xkQu6G8BzmCqLT4hyefCprXvfd0f8jH7GzfIgWo6m0ogTcJsKThS0IDdXkvuAZqlv
	gZf0UaQE03OyV7LsI7foEjD+vWyMGiuQqanTjZA3j0iggktJGAKMtHWhfLcZTsDpG2NrqaY=
X-Received: by 2002:a17:902:dacd:b0:220:d257:cdbd with SMTP id d9443c01a7336-22780e2a4c4mr364017895ad.48.1743001874734;
        Wed, 26 Mar 2025 08:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYZ0XI95E0L/5NYf6WJHkBEt4e1Xda2uFeWGiePRSJhve/Jd7oj9b0xjAQVL5MNlyD6vuNHw==
X-Received: by 2002:a17:902:dacd:b0:220:d257:cdbd with SMTP id d9443c01a7336-22780e2a4c4mr364017345ad.48.1743001874179;
        Wed, 26 Mar 2025 08:11:14 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b28e3sm110858775ad.156.2025.03.26.08.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 08:11:13 -0700 (PDT)
Message-ID: <8edf77d9-1afd-402a-b966-d1b3e5b4ba1b@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 08:11:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250321162331.19507-1-johan+linaro@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250321162331.19507-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e41913 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=K3_Uot4QyE093sgO9NIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: t2fgyJIteikOaY-jY1XiDCKht3odeKD7
X-Proofpoint-GUID: t2fgyJIteikOaY-jY1XiDCKht3odeKD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=773
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_081117_269386_8F71B782 
X-CRM114-Status: GOOD (  13.79  )
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

On 3/21/2025 9:23 AM, Johan Hovold wrote:
> Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
> without an iommu (under OS control) similar to what was done for ath11k
> in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
> DMA").
> 
> This specifically avoids using bounce buffers on Qualcomm Snapdragon X
> Elite machines like the Lenovo ThinkPad T14s when running at EL1.
> 
> Note that the mask could possibly be extended further but unresolved DMA
> issues with 64 GiB X Elite machines currently prevents that from being
> tested.
> 
> Also note that the driver is limited to 32 bits for coherent
> allocations and that there is no need to check for errors when setting
> masks larger than 32 bits.
> 
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Please make sure to include linux-wireless for all ath.git patches so that
they are processed by patchwork.kernel.org

/jeff

