Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92E8C982D7
	for <ath12k@archiver.kernel.org>; Fri, 18 Sep 2026 18:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlrqp6hzEyvS2JuXrzVg/2ASZasMwkiKMUs6oP7YPjU=; b=hhqI7KczMV+LOLUOhIYL9/V4p4
	y16UtjV9Cd/LPSc4mCpvpXCP/nsMNDkHgMOoEhPsdQo95pqwzFMslEtZ/Ri21oyl6VEvzCkrMK3m4
	loc/JzD+N3wKVyeiuO0P/3a1kMdzX8joge46Bk28DVPYt2ybUJCO0FR4U90kAqKflgglUHcccuY5A
	G4PoAsxbCCOUmMllIdynw+oBqZrH3DMGiIAbLkfjf+ODXDtfl4gU/uiisxOEQ8uJzYlyGs0XdpdkF
	vWJYDArsUN3Fk0Y8YFc/Lc7RuiSfHjxirmt2qX6jCrIUB4e4EsV4tJ35q3lxvhO/EJoXc3TsJ40R8
	o9PTg5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7d5r-0000000FGKd-05v6;
	Fri, 18 Sep 2026 18:13:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7d5n-0000000FGJJ-3L2q
	for ath12k@lists.infradead.org;
	Fri, 18 Sep 2026 18:13:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGo2iB1483049
	for <ath12k@lists.infradead.org>; Fri, 18 Sep 2026 18:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlrqp6hzEyvS2JuXrzVg/2ASZasMwkiKMUs6oP7YPjU=; b=QnSiSkrBsQffLT2m
	/WdGxKrll1bdiyVF5lVP37RUWAP1kVlS37YajVydWd+bTWHY6SP/0NFwUhDO3ZtV
	6MySMjpuVY0RQ2x4J5kye9lloYTC3mXXc6vvo3X0jOSro38GWRDRcsh8RpdMQ7f8
	wrNG+VRzNNNH5fLuQleWYapmnEAalGWb1GK/KXXOiNBrfQ9hUzLprhbZlNR+IUmN
	TIO2uA3b5iLJHP+LR8RBcPKra+YAIWPs6LpaXgIOERPuhUUce1tQ5KVY7wvGd/l0
	lnnY6vzkGGO1jB4EYQShfL3YJvlnTT+FV0fDMJZsaCFrmL7ozjCRRNkiWO532YSX
	fBGxlQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs7jk8w8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Sep 2026 18:13:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so1778187a91.2
        for <ath12k@lists.infradead.org>; Fri, 18 Sep 2026 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789755226; x=1790360026; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlrqp6hzEyvS2JuXrzVg/2ASZasMwkiKMUs6oP7YPjU=;
        b=B4SSC11gbcERh5GGM19ZHBfvzoJKL3IjSlcwGZRagzBCOtjt97PwUKinmflC3TKR71
         A0kfye29GlkZ6qG2vuemJMsTjPBWbllZiDnv4mj58Lv32NTobM/ZHTFLpu3CahFtPieK
         YhHpkgmyBL5idA3qrHKwISaxFTGYPHrimzHqUIoWmRNO3f1yHHE4Jpxx3sCZh3Kfj8F+
         Ys6mJYZ98l8T0BjwTcUT+88OKQBFlmkEW+t9TCYcTgxX0Bag3ohht9IPLiMbCT9n4V4x
         vDvN85TCS/ebEuFHS/uy87SQXEtCg2ImQCuV3b5uPImBhieE21G5GqyaglSxRLxttJ7S
         JA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755226; x=1790360026;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlrqp6hzEyvS2JuXrzVg/2ASZasMwkiKMUs6oP7YPjU=;
        b=F7TshOfe2i8LnG1DxQfPyzlW79bvwxND10dVUj7P8IYT7bwSYd8jJmgcB/dAD7I6Jz
         yaKGGKC8YOzRfrZvyuJgG7vFp/KFqiPpcyd6dyHbeDZg5ywyb4bMxt7PtT+SuGNHEMfV
         sbHtNT1K7BSBFlQi9A+m49pW42ErKpeWHpE4G0ztaD5lFPIILPrFrWTtijlGd8MqRpwA
         95qJz310KIkYHBnyum0roqiEFdD5T28L3o8XCGTF7ucRW/Y86oUO/dLJQLmNxWtMIyfb
         6czMaBCaXmaUaT/fOgSOHuO51P7iFiH0Vup+XKK3wGELv4naMfj1mbE0vc4TD0swUqOM
         z7OQ==
X-Forwarded-Encrypted: i=1; AKwUvByQMtU3WsuBshpa16l7nnTQcJPErmELH6C5gRJnqUu0/Ms1uruvxwYOlNUuGLAKhTx1Wsb7jDg=@lists.infradead.org
X-Gm-Message-State: AFuF++mLm0814YQp8GlMo9gVEXCVf+O7wXOvyii52xaFit9ipYSr5Ccl
	Q+ESpwktv8gCRp9kdUhth/tr0HM5ErSUXq/8uYSiT7zaSokuIFbEbPgYHmfokx7XLSN7qCJCisB
	ADC00I8KNqL49WHY7JpDhZk5WMVnK9OnLTJxYfN5f5W9DJprZJuaDqo2yVZaqSxUq
X-Gm-Gg: AYBFou38PzDJGCSnb8Ijym3H1zGY9V3JUnvsKPjDPQnrFJcQaw/dGxum6JdM0wMvT6x
	3snnzzTzrO+pUEACOP1JHqrAIdYIlHZ9uUQ4itUzv8QyzIadNJd0Lt8v8qBqqTjG/m2nfVRe+Zb
	LHDCL8MWBInaiPeoDdmaf+9wvXp/95xGjmApEQX3esMXP007qg+FCW/7x4o2wrTd7JQH7A/ZjF0
	fB5+oM089ZE478AqXG9i3NEwQEwnItEyFTTTk5YWk+N5MbpimVrxBqeNyM9bszgKoWvCZDij5YZ
	b+gP2QHIg42byoNGNn3OnuCZ2MODwsLHgNlki99XcGHfhjFLm25EIIBp7yA0SI1q124ItpWsLfa
	rM/QibNcSehAw3desY+BNEeDhy+GhiNs5FOF+6jTEYBr0oPtj9itJgzhsdA==
X-Received: by 2002:a17:90b:134f:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39e54d3651cmr7028568a91.22.1789755225597;
        Fri, 18 Sep 2026 11:13:45 -0700 (PDT)
X-Received: by 2002:a17:90b:134f:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39e54d3651cmr7028536a91.22.1789755225051;
        Fri, 18 Sep 2026 11:13:45 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331433besm467963eec.16.2026.09.18.11.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 11:13:44 -0700 (PDT)
Message-ID: <4e0481c1-9288-42d4-94c9-e18da5cf8e5d@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:13:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] net: qrtr: Add support for using identical MHI
 endpoint devices
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
References: <20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260918-qrtr-multi-ep-v1-0-8a06caa368d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jQgcPTeM39NO5Hblnw0YUT8Caiu5oDzH
X-Proofpoint-GUID: jQgcPTeM39NO5Hblnw0YUT8Caiu5oDzH
X-Authority-Analysis: v=2.4 cv=FeSiV5+6 c=1 sm=1 tr=0 ts=6aad7f5a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KAMPhC-K3bquQAzTacoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI2MSBTYWx0ZWRfX+dYrgkUHs5Dn
 O3Z8Cd3wSZEE9/m5U8U6pJQ+oDXtctZeYrVOSmephwYrdDafxU3GUODN599x2AA9Ym+loJPwu6+
 mVKGQ2rnlba2dJV33YZRiUYGi+urSIfVLmfAgX5T8RDn28j+3pSa6spRngyZ7yu+WSZiLQgwAOQ
 x8b9jAXqggMT+UrhPQdXk5S6OZlNhqrVhAauck/9UQabM5JVQAH6Kv84QEZumCP8IVdvyS822Nt
 Z3mwM/nfLETeN10YaknQlW4agviW9gU8S7tkgB9j5I8lXwU7VNFqWqSPYmnnkGwkAPh77R4xhEb
 AvSfe9ZF4ZGt7hnE5HvNXOiJPxKoLv0QaP5XGE94H0PwO2VFf64SLLr8NXji0Kll8xcDPKjblkf
 ZjrHX+y5OZgKwhDERUTVFxxBG7JKDZGcerqcgXNI4axIpOH9Uqm+Yv8uyFASzx2+FanC4rPjwr8
 4QefnAOyviAsqr+pABQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI2MSBTYWx0ZWRfX8Mq6PIJS+veF
 mcRYJT4FmbbjcaBqpvpJTORWytQYfUWATF4gORIIVNM1cIIaKD1ONz7BtlTHjDnTq5iG87Lhhii
 mB5S6idiIivWWTvKarPNRdJzsROBSZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_111347_962481_FD9EA37E 
X-CRM114-Status: GOOD (  24.48  )
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

On 9/18/2026 9:28 AM, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> This series reworks the QRTR driver to add support for using identical MHI
> endpoint devices at the same time. Currently, QRTR driver has a limitation on
> using more than one identical MHI endpoint devices like QCS6490 or any Qcom
> Endpoint device making use of QRTR at the same time. Because of the fact that
> these devices will have the identical QRTR node id, they cannot be used at the
> same time, on the same host machine.
> 
> This limitation is a blocker for running upstream kernel on devices like Qcom
> based routers as they often have multiple identical WLAN Endpoint devices
> connected to the Router SoC.
> 
> This series supersedes the following 2 series from Juha:
> https://lore.kernel.org/all/20260915054207.2513877-1-juha-matti.tilli@iki.fi
> https://lore.kernel.org/all/20260915074135.2567411-1-juha-matti.tilli@iki.fi
> 
> Compared to the series from Juha, this series simplifies the multi-endpoint
> support by computing a unique node id for each MHI endpoint and uses it for the
> internal QRTR book keeping. This ensures that even if the MHI endpoint devices
> have same node ids, the host QRTR will always use a unique node id for each one
> of them.
> 
> More details can be found in the individual patches.
> 
> Testing
> =======
> 
> Juha tested this series on multi ath11k setup by backporting this series to
> 6.6.156 kernel. I'd appreciate a formal tested-by tag from Juha and other folks
> CCed to this series.
> 
> Merge Strategy
> ==============
> 
> Since both QRTR and ath drivers are falling under the networking tree, the whole
> series can be merged through netdev tree.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Manivannan Sadhasivam (4):
>       net: qrtr: Allow the host QRTR to assign a unique node id
>       net: qrtr: Assign unique node id for MHI endpoints
>       wifi: ath11k: Connect to the QMI server belonging to the device owned by this driver
>       wifi: ath12k: Connect to the QMI server belonging to the device owned by this driver
> 
>  MAINTAINERS                           |  1 +
>  drivers/net/wireless/ath/ath11k/hif.h |  9 ++++++
>  drivers/net/wireless/ath/ath11k/pci.c |  9 ++++++
>  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++
>  drivers/net/wireless/ath/ath12k/hif.h |  9 ++++++
>  drivers/net/wireless/ath/ath12k/pci.c |  9 ++++++
>  drivers/net/wireless/ath/ath12k/qmi.c | 11 +++++++
>  include/net/qrtr.h                    | 21 ++++++++++++
>  net/qrtr/af_qrtr.c                    | 61 +++++++++++++++++++++++++++++++----
>  net/qrtr/mhi.c                        |  4 ++-
>  10 files changed, 136 insertions(+), 8 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

I see this is based upon v7.3-rc1 (current release tree).
This series doesn't cleanly apply on the net-next tree.

Are you planning on netdev taking this through current or next?

And an alternate merge strategy would be for netdev to take the first two
patches and then after wireless fast-forwards and ath fast-forwards, I could
take the last two though the ath tree.


