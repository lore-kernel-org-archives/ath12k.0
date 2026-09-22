Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89904C982F1
	for <ath12k@archiver.kernel.org>; Tue, 22 Sep 2026 11:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=; b=nIBDZiS3cWBN95387su67Rarie
	MtPBSZXjaJ/Ctd3WPqFznKL+Hu3QgYeMXlnHka2LBXZM3MQQ1vyc4FpvoSTuTCicHZxE4uFqGJ+4f
	ugrzECkke1bUjbTm2e1Hc4w+r7CvApmZ3EhLGw664V0a8Epu0V1QJeJm5y6HmNMFJ08GEA0x5w0GF
	vRiHemh8zfkPMxex5Al+SeHTjXwFBeoNXuopWOgM+sKhckR1+w4gVntRAUDbhlHnnSJRGhh4w4Z+j
	Lwj6bj+TZaTyMBL9n8wPHsZ9rw8kuSWwf1GZRmEWwsmiA6ut0oXJjGvl9DwUQNC4j5yHTALeNgdsk
	sQcF7vxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yGU-000000058In-2KZI;
	Tue, 22 Sep 2026 11:02:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yGS-000000058IH-2rLx
	for ath12k@lists.infradead.org;
	Tue, 22 Sep 2026 11:02:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M78XPb2165613
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 11:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=; b=O/9/FtWxxKdesNdn
	X+jhngUM6a2s+f8cRg9BnTHs2IB1PNnBRiC1xXp4TMMwDFbYjqQ/N3TVfUQJW8sk
	zME2nth6+gxZpgbZ3yvB2MeeqBAD/tYgO2iRPyrrbkFNoGL8sq2Y3s4l5jgI2qX/
	uUHppnv09sG4NdpeT5LckSjZU3vI5z6hwxhRw8QYWBawGSRVF+v6R51JZFtrOV++
	3lByHLhyPB8ufyRl5Eh5sry7IL8HqFOTY19Y1dQHC3g0rKiW2An1/8k+OYB3TLSD
	rrVbvgu1cGLnMQMVey4MDWaNNa42OakQEYZLFaQ5C6rW7crCZ5Y+qfEXn5g95DVY
	8PSBfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeump0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 11:02:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso3730982a91.1
        for <ath12k@lists.infradead.org>; Tue, 22 Sep 2026 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790074939; x=1790679739; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=;
        b=eXMCV8yJHzqUpgxUU3CBf/rDHY7CGVosxk39SdRqpyr/n6+eevxw7onM7knGahRJ2Z
         wZELnfwTzs+9CPmnUgdFLh/cEgbv+w6tD6qAj58E2qEsVQFEnGT6uIBE95t8uOogVwWh
         NmfcT5yqSqR0cnvrLBO5hp7jTP0JqGtO8ONhocjr6OzoxGcRVYEdR55lszwvywVLfbLU
         xVVJpW5FwjTZF92IYL5pAR+ZWE71uYquK8jb4ytDJZDkyDQw1T+jApLjLrpzjy/0MANr
         guvyyReITRGefXRBanlMPtYLamZsuuiU2FyfS7nVoFoMNJ52d62rQtup72ePG0EX0KQK
         uE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074939; x=1790679739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UG1NMm+Qs5qSxVwFob/kretHVwJFEGJ0GkvM3SFCL+U=;
        b=zRw5A4xqyeXFJy3dlTAYZSE8jLJTgeUKJiV0g6kQFyt+BWGG9kxvltX0J8t9jRzUs8
         XQS8999gpmEe0ZkNNEHlRjDqn1w4HGU8eKOdsdDmrWlN+JBXEIbTSkUimtkyh70E9B3c
         Ys7Zh992g7+yKnsh3nlbxKK8A+qNjt6Kj0oUhiLSwCa8zg7UOGbGnAnPhkM4lSjWKsVT
         lvpsMcv8/dNUTJkrHlYQRv6BUmiBzGMap75D+22LeHFONqu4SO3jAmyyYtUf06SoS3Zo
         di4gUmEvCLtmKKDq9+/YPNy6eFs/sg2gVYGAFbUKIY9jlIR1/UOO8XCv7zxmsuu+BA5d
         fd5A==
X-Forwarded-Encrypted: i=1; AKwUvBxMCrWBiv4bczwkYszhLa2aUJSo7Xa1PSGHlqsE2FhOJ/k1Qiag0EYmYrDFBl7xh6VYDG6wIxo=@lists.infradead.org
X-Gm-Message-State: AFuF++m/NGFIEXmrl1+qNllJyO7JdHohTgac8I5yrCe+m1hKQWIRhdrV
	R8gn0pMBDM4tSxoeNhfyGCyi9XDg1H3v3V2W/yQG/QOl77sr0csRarej77SzfjJo+N5VWYjVs49
	QX1OcxJhEZFrM/Gb1Y6HVSqLvEcwHD1N+/Zv9/Tbor4IW4yAfiUv5lVIV1id03IXY
X-Gm-Gg: AYBFou1/a1Eom6cIQzaJs0GApX0a6gRGZEbm54JNoIxjC2WzO+7as9+Zre06Cc5MBJV
	/N1RfwwtHlLK5r67aWvCT2Y3bFFNVEcVFH9cMNHiw86oSzpunTAZsedU9TmCZ4uIGirmGDJhPRB
	6Hu0aTFMR3y8rjbXpQrnr9FtxBwZQGse7kiZWJeblxd1ZB5PQ1VwDFKKTa4irgt3bNME3ccoL6z
	8OOX1Os9EMw2XKeEskskrZXXxzvcJzqQU+Nh/gsjXmbgCVFhAPy2dkallhqEAnpsMStc03ULafz
	ZZAT+PJNpSnoVkFc/TSwAT/SONHXYvHq/p2vJPyApdogjPLYDF/IKlQoBtTBDn2x9rgAVah3+wj
	OZkoxcURQuKcmLqXI1XF2mGg/tMcrYyfzx5L+RrU0DaHqZFc=
X-Received: by 2002:a17:90a:fc4c:b0:39e:6c6a:4b65 with SMTP id 98e67ed59e1d1-3a073240acbmr919715a91.47.1790074937887;
        Tue, 22 Sep 2026 04:02:17 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4c:b0:39e:6c6a:4b65 with SMTP id 98e67ed59e1d1-3a073240acbmr919631a91.47.1790074936903;
        Tue, 22 Sep 2026 04:02:16 -0700 (PDT)
Received: from [10.152.209.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f294d894sm7775851c88.2.2026.09.22.04.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:02:15 -0700 (PDT)
Message-ID: <3f31a185-b7ba-4ae4-a3c3-874bac0d66b3@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:32:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] wifi: ath11k: Connect to the QMI server belonging
 to the device owned by this driver
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
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-3-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YqNWOlj7TfkKs8T4ptRf2McID4l_3acV
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab2603c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uJV0Co7Z9vYWId34oq4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: YqNWOlj7TfkKs8T4ptRf2McID4l_3acV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1OSBTYWx0ZWRfX5goP6iiiDBxp
 PVpeRumWEEkfRGRhFw6Pqcr0+B4TgmIxu2FkaufGZQ7kY/xJlt65hOQpx9KTfvX7daJ/mHRG9fm
 fXNR5yXvDyRTQzLWkOn2abvhFhQQQTIJE2G5xoNZeSq6M36fLj0q1NOhAYYtOlTq3Xx41sxalbl
 bTj7nWHLlgetO1fnF00q1ikRPsSZenM/g+A+vT2r9SlOF3Sb8WPAHUSfp/2SjXrq+EUH9pIn6ZX
 9pNiVBqwxG+YD7/S5ovEwpY7EvvGq259XDbUTo/NfqKHfsPVWqYPVIVY3BSzxxeHU6yc0KOT6L/
 JLJYCG+A0TZct3CXXnCDofouyjJ8EXVcua1mkSRYNc3Hiz8OD8h7JH2I23vszK/PvLDsKIRu4fd
 uhjJr4HM9ad08B7iseo/vna4w1cWZiFbVwFLfPJeMe3kLkV2eqrmW2enH4f3G9Qc422Xt5uFLzy
 QphLk1CAyKNbJWouYCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1OSBTYWx0ZWRfXxvNn24LKK09I
 bmxaPhpi62ELtL9ywMjFanKCJQBtHC6zU1PWcK+saeimblOWFhCF7f07MOAYYUrkeJ05f96S4Mk
 Bhq8+uIjSVvJ+kf0FpkX0Ha/YZnGa0U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_040220_718371_6F492D21 
X-CRM114-Status: GOOD (  26.01  )
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



On 9/21/2026 4:53 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> When two identical ath11k PCIe devices are connected to the same host, both
> advertise the WLFW service with the same service and instance id. The QMI
> lookup reports both servers to each device, so a device may connect to the
> firmware running on the other device.
> 
> But now, QRTR provides each MHI endpoint a unique node id which is
> different from the node id announced by the device. So use the same id to
> pick the correct server. Add a get_qrtr_node_id() HIF callback that returns
> the node id derived from the MHI controller index and zero for transports
> that do not assign one. In the new_server callback, skip any service whose
> node id does not match. A node id of zero disables the check, so transports
> that do not assign one keep their current behavior.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath11k/hif.h |  9 +++++++++
>   drivers/net/wireless/ath/ath11k/pci.c |  9 +++++++++
>   drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/hif.h b/drivers/net/wireless/ath/ath11k/hif.h
> index 017fed1b4bd1..0da9025c7ed8 100644
> --- a/drivers/net/wireless/ath/ath11k/hif.h
> +++ b/drivers/net/wireless/ath/ath11k/hif.h
> @@ -32,6 +32,7 @@ struct ath11k_hif_ops {
>   	void (*ce_irq_disable)(struct ath11k_base *ab);
>   	void (*get_ce_msi_idx)(struct ath11k_base *ab, u32 ce_id, u32 *msi_idx);
>   	void (*coredump_download)(struct ath11k_base *ab);
> +	int (*get_qrtr_node_id)(struct ath11k_base *ab);
>   };
>   
>   static inline void ath11k_hif_ce_irq_enable(struct ath11k_base *ab)
> @@ -159,4 +160,12 @@ static inline void ath11k_hif_coredump_download(struct ath11k_base *ab)
>   		ab->hif.ops->coredump_download(ab);
>   }
>   
> +static inline int ath11k_hif_get_qrtr_node_id(struct ath11k_base *ab)
> +{
> +	if (!ab->hif.ops->get_qrtr_node_id)
> +		return 0;
> +
> +	return ab->hif.ops->get_qrtr_node_id(ab);
> +}
> +
>   #endif /* _HIF_H_ */
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index a163168f3617..4d327b5cc98a 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -10,6 +10,7 @@
>   #include <linux/of.h>
>   #include <linux/time.h>
>   #include <linux/vmalloc.h>
> +#include <net/qrtr.h>
>   
>   #include "pci.h"
>   #include "core.h"
> @@ -900,6 +901,13 @@ static int ath11k_pci_start(struct ath11k_base *ab)
>   	return 0;
>   }
>   
> +static int ath11k_pci_get_qrtr_node_id(struct ath11k_base *ab)
> +{
> +	struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
> +
> +	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);

nit: since qrtr_host_node_id() returns node_id in unsigned int,
may be maintain that in the return type of the callers as well.
Mostly harmless as it is unlikely that node_id is allocated with
an extremely high id. Either way is fine with me. Same applicable
for ath12k patch as well.


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

