Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DA6C61D97
	for <ath12k@archiver.kernel.org>; Wed, 22 Nov 2023 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IXzehrQGeGYok99euNEd6jmE0oYdl811URo12yzORY=; b=cz553kdPz/mvl2
	KTeSnrhsPMzsiY8sfHD0JOYBXgYw85yBPwiekPULyt9XLMJBpVgTKZY87PlYnPxwjw0MOlfbReGGK
	zEE+jnljYCzIJpeMG0W216P0hpvd0eU/zcuOIoQxXo9+gnEAEHkpDvABYIY4l9O2Q/8EFAMbrsd8E
	nGhmG55+98PRAdEXr7OEvgapXpGjcoooZeq4q98u3UT84h5xjTyZWy6QN9PAOjGhSCdc0cOmc8fSU
	DMJnUSoBwXlZsY9yC1mk3N1ZZ8mJDBlugqNK8Qwc0vu5lKbjYJAcy9gDuskl9sjx17d5PoWLq4+3A
	1aQPBtvW8AfVCcjHh/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5q7w-002TP6-2l
	for ath12k@archiver.kernel.org;
	Wed, 22 Nov 2023 16:31:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5q7f-002TJa-0Q
	for ath12k@bombadil.infradead.org;
	Wed, 22 Nov 2023 16:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ooLwiKr7YFkuWv+mAjo2CKrIt+gr47FgPEncR9VXhxU=; b=d0DAHJoJQu6kMj9YvMg0i+n9Mi
	kTw0ox4xuHXBK1Kzyl9M8kdZsJjmcT345Diiptd1YM5AsmJQBqS2SlQEaZTt6M8176T3Si09TpkqZ
	V9YUWFLm6tqooc4gleouBRHS6aGOkjBVUbS2b2ij8JMiDuLmKtwgJlryofOpeNsnu6rQRKUpdyNDE
	9r4uMKpKQPctaR83UtYjAzL5v00DTkVt7geLJOft7kz3bkLGZPPAEYf76KCoTrckf9RMplnPRC+PU
	OFwcLJt1yMzk+DyQabCa9r4VisCU1YzAmDCjHb9G8QGeaAMK9TfsPN1OdweAZWyqXJWZfPpKhhwTg
	g9SfHSOw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5q7b-00CMwc-2p
	for ath12k@lists.infradead.org;
	Wed, 22 Nov 2023 16:30:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM9NIx3017219;
	Wed, 22 Nov 2023 16:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ooLwiKr7YFkuWv+mAjo2CKrIt+gr47FgPEncR9VXhxU=;
 b=Aghy6+eHdURUFgEQFGi7+2WVF7e9QhYHOb3IhtMBnOmxgB2500a9TY9b2z/myLVnbGXN
 /AWj5ptSApaJQkdW73IB6nmjkJfJCROILx5y7lC+vbXyTGg+3FC9d/IpoYLZNP3TPtdH
 DpLEXKRSjbgTj9mwBua7r9VyphseQxIi/Cn/H4FIbr4MNWU+Lq5bZ1tE7V8fJ/jzw0bW
 yZEOjG8VaDZeVcKqooIDlJca/MQJ5SiS+wsp/z+SouCIXYQcq562wrwK1sZy7I1LXQtw
 jGiKKxhdKUKpDVcpAGfGTXRzngBoEZ46W4+60y0eAMSUoWGhS13njvM1yBboT8rB1adI qw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhey591rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 16:30:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AMGUOPY006343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 16:30:24 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 22 Nov
 2023 08:30:24 -0800
Message-ID: <2204a1a1-d437-4c69-9e3a-bcc7807c8069@quicinc.com>
Date: Wed, 22 Nov 2023 08:30:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath12k: fix calling correct function for rx
 monitor mode
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231122063932.10321-1-quic_tamizhr@quicinc.com>
 <20231122063932.10321-2-quic_tamizhr@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231122063932.10321-2-quic_tamizhr@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1JDC1QUZtYwUmoA-MAJnb-7Ai8jiEYd8
X-Proofpoint-GUID: 1JDC1QUZtYwUmoA-MAJnb-7Ai8jiEYd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_12,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=804
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_163040_230583_B2BE89BB 
X-CRM114-Status: GOOD (  10.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/21/2023 10:39 PM, Tamizh Chelvam Raja wrote:
> Currently in ath12k_dp_tx_htt_monitor_mode_ring_config()
> ath12k_dp_tx_htt_tx_monitor_mode_ring_config() function wrongly called
> twice. Fix that by calling ath12k_dp_tx_htt_rx_monitor_mode_ring_config().
> 
> Currently monitor mode is disabled in driver so the change is compile
> tested and boot sequence verified.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

Since monitor mode is currently disabled, perhaps we should drop the
Fixes tag since there is no reason to backport to prior kernels?
I'll let Kalle make the call on that.

> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
