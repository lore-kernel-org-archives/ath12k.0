Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2B6CDB485
	for <ath12k@archiver.kernel.org>; Thu, 19 Oct 2023 17:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uT8ujuWLyNH3vLQDXF4cULDfdLUId3VTiU03iukbG54=; b=JWZhpWNdHGZxNX
	BF4K3+S+HLKVvHHYTgM/2o/+vRI9HbuIxEY+5Zp+sDfP8L5mgVQGnqHb08xqmpLSQrCr62WZLLtoT
	O1iZsJuGRWPgTVWA1WMHGXUJaUxlPvGtGg5liKJsgMJdAaYHu6bNmCGSDM6R2JxJEzaPzmifk1wpT
	2UVhnhKXqwzgbyA2Q4uyO6vzd7BXODNWA3YF6ZXqZKftqnfDk8xlrqjeEtCRDzDyOAKuEJcUie3J4
	d70BT/4BWHey7RkZwPyq3osOQOHAljd+oPZ4kkZrqpbtv+B6s3T1coI+UJJzYBruSMyjm41B/5HrQ
	/UxfuYUftC4BZjcXXJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWrP-000QO5-1x
	for ath12k@archiver.kernel.org;
	Thu, 19 Oct 2023 17:31:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWrM-000QN9-0q
	for ath12k@lists.infradead.org;
	Thu, 19 Oct 2023 17:31:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JGRhcS030815;
	Thu, 19 Oct 2023 17:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Nf/29FghDRhiaGg0xKf0f475ZS/kQXtuV2LNjym+dh8=;
 b=PFWGdF82f5gPEQkZ23uZCe67GzGwLlAkualgUXG2trnRxsJ5Ae1pkZnEg6140KNJhY0t
 bNm8btvhouoIXPI6nEOy5HYH20rwjE7bj6Wz3ZeUfVAzNf+kXHhTA5zjnbGClxE0ik32
 DTmb2WSdzB5/wgCFAotiqjUZMB3wVWPiLnig7VmVesrCEt6910m/+yxp9ocNtJGJP55X
 OQmbJeD0vraOd4LIIXcyiW7c2OGRL7Tlh7DT1styz5tylm1dTP8nJVPXe6mFxowJS+VK
 MVXM4QbS/rASclgMDSeBSBN2Q3Gsxor1wiPUxths4sz6+5+76rYzQzwIiFMAZs7udLVR Dg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tu49b0qn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 17:30:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JHUvkp020339
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 17:30:57 GMT
Received: from [10.48.241.70] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 10:30:57 -0700
Message-ID: <3cb5372a-aa11-4184-8f3d-969ee25e0642@quicinc.com>
Date: Thu, 19 Oct 2023 10:30:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: fix dfs-radar and temperature event
 locking
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20231019113650.9060-1-johan+linaro@kernel.org>
 <20231019113650.9060-2-johan+linaro@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231019113650.9060-2-johan+linaro@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L8mRo8YIcAOr2oMg7jgwUEJnQcbnmfcN
X-Proofpoint-GUID: L8mRo8YIcAOr2oMg7jgwUEJnQcbnmfcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_16,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=642
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_103100_303103_549B504D 
X-CRM114-Status: GOOD (  11.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 10/19/2023 4:36 AM, Johan Hovold wrote:
> The ath12k active pdevs are protected by RCU but the DFS-radar and
> temperature event handling code calling ath12k_mac_get_ar_by_pdev_id()
> was not marked as a read-side critical section.
> 
> Mark the code in question as RCU read-side critical sections to avoid
> any potential use-after-free issues.
> 
> Note that the temperature event handler looks like a place holder
> currently but would still trigger an RCU lockdep splat.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Cc: stable@vger.kernel.org	# v6.2
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
