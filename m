Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4A2CA5FA7
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=; b=kFCadstdMccqlmtzUb4yja++5S
	EUv9P4rEmmyqZQbQSmRp1rgYX7r/u01uVGRoJEroWBC0QSB8V0U4gBWOr+VoMf2RiHPLEfRgk1S/L
	UF8H5NzjzZ0x348wU8whdzoMLvewNH9/L7G41RHVBvSX/P0nWxLt7MK9j5duymGszvtGeh/W827Xa
	bvRPA8jB647mQ/YEYSe4b1Dd+ZOBPaapsMYP4OYpQ4geLucCY1H+RbW8fwZ+U/tgW/mAccRU+F1Sy
	WPjO6FZQC+y4wzFQijCu86Wpn5KLn8W6hB6VoP66vXZRZSdzJ3R0T7UuK5ydkGzgE/UhvuMQ0IiXM
	+lGfj09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBay8-0000000465M-1bwR;
	Tue, 29 Sep 2026 16:46:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBay5-0000000464P-1WOf
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 16:46:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE5jJd128759
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 16:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=; b=dEBN0i2tek0zDky6
	2xI8SRkTy6muUz4dBIrz5fe7jg4NsDeBcPu1fmFwmFPism/3Mve1tUgchm9vVWiy
	rbGvcFEEKFcZj7H+hBGqfrNwUVs0WLk17xz4pfc/afWR25wAD6QjogN1PTTGx4zw
	qeD7XSMnBp328oah9kwACp33yA6E075kQbHQPfJlHPBLA5JD9V2yTLZ/+QlDGCCv
	g1GygBe2FclhSsPSm7KcP6DP/Yy584l0vcAVGOXzvdreTAF7Eado4xpA9w+2QJXH
	/m8beGrThSCMXvlWsajxYKXc2ig1azBaBspMBFo7EgC+CbiLC61r5+ZhMM1aQtjs
	yc1JSw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0eswgrdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 16:46:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so4155638a91.1
        for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790700372; x=1791305172; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=;
        b=hMmUpasRy0WNN4CWbTB2Ln5I1+LxWw4nlh5IDCfkPlO0BMHS0MEplBI6/BjgIVOmpE
         RQMFIZtgR86XqxVrK7VJf2dSJjqJWRfo58SAnoWvPv3cmgL7lyLT+DDRWpop8+umypOL
         Sa9bEo32gvfBQb4fG2yA49reIGE0ikgIIdkeiKUA5muOZy5l9dyWIG8tighqKASGnTza
         twKAnwCvfu3TMuWOpOFz20BRmwJjQEgf7XIdy8ox8pTSeAmXxCsOTQ4a//voFNIe2F9w
         kYyXw4ygN+4F5VY0N7U+220X/rL1EWgVpbxZbF4/KfnBAwfEZKW6OANDFrUZ3T9vDPn1
         QgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700372; x=1791305172;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0skssNQvXHTm92GRJQRQsimYFU/uUs18xsPOZJ94ZoU=;
        b=q/UeLtmlvjcyvwPgnpI/6yNl4yzMLvWLE+DaJClvqYc28WtcxGHkdIvSPF0ORlj0JL
         0jQnhI7amK67vuJFGNNr3NkQAlz3+WTQxiekhnGgGRM2X03+dhbCLWxMgLBs5CQL/YBW
         XRjGw9iF0QbpoeuXcI/bHFmdaDFR/NvKfwKudEhCl4DlzIF0BvnrqnSyZ/awHfQNIifW
         +Zb/6oQASgaKb2J0oILiRAm6ahS4XHENyq0CnDPd0yE1JkL/cp1/YIQqnRz9PXExZ6yK
         IfSRvik9Fh3A2YWKBR6i+CrhMBnYuWlCuNkg2SpkrdcVqdT4yxzs5+MVuXSXAZEtF6/O
         h7PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcFAG4LhYdEeYOuboxk1IGrS0IHV+lk2UKKgaU83UwICn8Qn9DFedYUuKrtTiv93nu+M+LuQ0=@lists.infradead.org
X-Gm-Message-State: AFq9FYIZhRQGItZr7Rd10Crs6ODq66zbSxf+oB2EOtuAjNnn/B/iiJ6C
	thzS86LmvuUPWH4HI7Sqy0r3pqiV2Xv7CuqsOdr/WrxII2RUoAbtbHLLahC3UCDLDs0UWBFOPzT
	t4xCgct+LYXMb13fH3aHywuBXk9Ppu8OcVGxdd4bY8elQpgV58zkcojmQs9ifAfM5
X-Gm-Gg: AYBFou0r+g+gMlbGYOcBe3mj/d7WuJQqqRSzckx+DTo+LPHHquStwUHXRN174cqpNf2
	FpR4X7ajfWQymtOistJw8s0fqwt3EBc0B9NjvG+jJ/CUuRbX2y3EhznXWyaCG6S1VJPEybeiihq
	bNQtDjY4Y3XC8vkpo8aEJ597gZFk7VfqEWIY7SZcBd25kky0CxfGSFdktFVNRKq1pTGriGw1+1i
	4ebuLzzDx31QbFNLenQf9VHrocB2MJLUHyd4Ki9r/LvjXaFXKrnTNZJ1eXP+93rC1AJL5QWZSAc
	kzdKXh/XhX/gZoHTbYHf4c+mHEc6gCt0SrmHd9d5fSCFMV8BsNLxy4jTOWPi+KdXXh5ai131jIh
	8oWJ10UuFpRmyZi+W
X-Received: by 2002:a17:90b:384d:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-3a0986eb55amr14369927a91.2.1790700372087;
        Tue, 29 Sep 2026 09:46:12 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-3a0986eb55amr14369900a91.2.1790700371572;
        Tue, 29 Sep 2026 09:46:11 -0700 (PDT)
Received: from [10.216.29.115] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858bf27sm6367683a91.4.2026.09.29.09.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:46:10 -0700 (PDT)
Message-ID: <7aed969d-0868-4c9c-967e-7766dbba427e@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 22:15:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260922-qrtr-multi-ep-v3-0-c00831e88957@oss.qualcomm.com>
 <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
Content-Language: en-US
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
In-Reply-To: <20260922-qrtr-multi-ep-v3-2-c00831e88957@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX9pyaR+icwJqS
 ep6VuKCD1K0jxncXE6SVcWHdZxJhDWy2FYRq5WCUek3ZMC1JNh0f60knUERd6Wyjg+MA8nu5LpG
 PrQV9TLmsQW8Lt1nqExOtZ9xFERtxNxZd4PbKOFkJtmzUKohArlcoY+HlcmuoC7ebjwASsNfzna
 q6CMNnp+sJkBhlNHHy4pGkBbp/1ImteVRhcyUfXAaCfSs0+SYnN1MlfVwbZ30KbmCzURvFpxvoS
 qi1G8oE4GweKfVMugyaXREUxfPdg9TvSK6DV1TkN1m0cAwE6ee0GYPoKB2a/wr9NE80doDLYuPP
 6XeLQQX8JFykXRJqAcjwwMH3MHYx1D98CMsDo5EdOtrD1vWZ4Y3T9+mlrrCFq7u8vYqsg/GjP4t
 7SZwmlJ2jj8zdHGpUsqvZvhVeOJNhUJAckXFuBqH32sJ4t6hIs5jJTheGkqsqs+K6m2gA4zIuZA
 3E9xVMxvQxNIrIQ+bSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NiBTYWx0ZWRfX8eOiFvcgLPWn
 paZbzNbCLI9y1Ztn2N0o9508eZ9C7bX46t1Qsaw4anSHpipDqAUZhfQEz86wjTeVIQ72CmhM6Av
 49mQS/VYDksa/anaHRMS0ki3hciCbJY=
X-Authority-Analysis: v=2.4 cv=LaWpeTfi c=1 sm=1 tr=0 ts=6abbeb54 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4CdhTua64AM6UaT4niYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: KcHmkC8XJtO-djTDB1sCcQ01tGKz7x00
X-Proofpoint-ORIG-GUID: KcHmkC8XJtO-djTDB1sCcQ01tGKz7x00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_094613_424478_A6EAC49A 
X-CRM114-Status: GOOD (  28.75  )
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


On 9/22/2026 7:11 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> Now that the QRTR driver allows using the unique node id for each device,
> which is different from the node id received from the remote node, compute
> a unique node id using a new API, qrtr_host_node_id().
>
> This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE,
> whose value is outside of the node id range used by the remote nodes (0 to
> 0xffff).
>
> Finally, call the new API from MHI endpoint driver by passing the MHI
> controller index as the parameter. The MHI controller index is unique for
> each controller, thereby for each MHI endpoint device.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   MAINTAINERS        |  1 +
>   include/net/qrtr.h | 21 +++++++++++++++++++++
>   net/qrtr/mhi.c     |  4 +++-
>   3 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index df8ab9b82402..9c8bb086be28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22511,6 +22511,7 @@ QUALCOMM IPC ROUTER (QRTR) DRIVER
>   M:	Manivannan Sadhasivam <mani@kernel.org>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
> +F:	include/net/qrtr.h
>   F:	include/trace/events/qrtr.h
>   F:	include/uapi/linux/qrtr.h
>   F:	net/qrtr/
> diff --git a/include/net/qrtr.h b/include/net/qrtr.h
> new file mode 100644
> index 000000000000..745d51b4a6ba
> --- /dev/null
> +++ b/include/net/qrtr.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _NET_QRTR_H
> +#define _NET_QRTR_H
> +
> +#include <linux/types.h>
> +
> +/* The offset is chosen carefully to not collide with the node ids allocated by
> + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
> + */
> +#define QRTR_NODE_HOST_BASE 0x10000u

Can it be exposed with include/uapi/linux/qrtr.h also. There are user space clients like modem manager
which need to calculate modified node id to distinguish same service from multi modem over mhi.
This is same as wlan use case.

- Deepak

> +
> +/* Compute host node id from a per-device index. The index must be unique
> + * among the host assigned endpoints and smaller than QRTR_NODE_HOST_BASE.
> + */
> +static inline unsigned int qrtr_host_node_id(unsigned int index)
> +{
> +	return QRTR_NODE_HOST_BASE + index;
> +}
> +
> +#endif /* _NET_QRTR_H */
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 3990da1a65dc..c920ab61f848 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -6,6 +6,7 @@
>   #include <linux/mhi.h>
>   #include <linux/module.h>
>   #include <linux/skbuff.h>
> +#include <net/qrtr.h>
>   #include <net/sock.h>
>   
>   #include "qrtr.h"
> @@ -127,7 +128,8 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>   	if (rc)
>   		return rc;
>   
> -	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
> +	rc = qrtr_endpoint_register(&qdev->ep,
> +				    qrtr_host_node_id(mhi_dev->mhi_cntrl->index));
>   	if (rc)
>   		goto err_unprepare;
>   
>

