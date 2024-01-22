Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B327C47DD3
	for <ath12k@archiver.kernel.org>; Mon, 22 Jan 2024 20:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilJ5msNuDNipkbaf3gyfAqtT0DsngW34MTqPZQWFNmQ=; b=VGN0Xhz35Xxmq8UCRiGpvTnDBc
	UnYPJCBsugwk3ei4wZ8Kj983Ig9WyEb/6Hl0hP/rRReXrAr/sSqWIYpRjHPXwlg8zQTi9+5iNJadU
	uEE7+FP4SXv1s9CWX1xgSplRoaoiw7R32U/+ATDLHjiFyd3bDHPzFgsmXkjmXc9dA9p/0YDIZmZqz
	FudmTnBNuJOcNmJjnCOge5+fztqKytuV1reeUYzR/AG7zqBbCRqZ1Ej06oIpTQqn42P2IFPI4KRek
	Ot9FSF8x/5aUZ61Ijpn6S93RoBOiVTY/mWk+rOiP5l7f0Tof39LpgJCRlB5+NqTcOxRR8IN/C7D8A
	X17sbXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0XB-00DqIc-2B
	for ath12k@archiver.kernel.org;
	Mon, 22 Jan 2024 20:04:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0X8-00DqHm-20
	for ath12k@lists.infradead.org;
	Mon, 22 Jan 2024 20:04:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MDqQrs012522;
	Mon, 22 Jan 2024 20:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ilJ5msNuDNipkbaf3gyfAqtT0DsngW34MTqPZQWFNmQ=; b=AY
	iQ5eZIXcoEazz+b0iYU5N60UtGoPGTu/JUsimhRje2T9qBQqyJwTeWFIyeCt2j0d
	KXOmuLA+y2SExr7bly/iOM9T2896jC+iS1fJ/Kk861VAkhVtPwLkqAr8uIN9qPCK
	4vmfduf4Q3DRWoaw+dnsHudfDSED+F7TRmxCSTAHqhwHjOM8uNHfrKPX5dM8MEsL
	HuwpuzTilGIry2OtxkfQNRKiM/XlrVi1MQZg4X8Inv5ElaHsf9JzUZCgfidkZrAo
	I5RKVlyW8pztiEVUB8rdXWRYzAdiHojPwvrF0ruIzUo3NCDoDazfeRFCzTLf6QOn
	AV6dsAa4E/tnFewvj76Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vskn19uuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 20:04:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40MK4XPT027301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 20:04:33 GMT
Received: from [10.110.26.199] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 12:04:33 -0800
Message-ID: <bbfc4752-0a54-4e8b-b5c3-86005ebaa834@quicinc.com>
Date: Mon, 22 Jan 2024 12:04:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] wifi: ath12k: P2P support for WCN7850
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240122113904.8938-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240122113904.8938-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vuhP6DCjv8KyxTggxqss1d4TAguw_b7i
X-Proofpoint-ORIG-GUID: vuhP6DCjv8KyxTggxqss1d4TAguw_b7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_09,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_120438_787554_E397A96D 
X-CRM114-Status: GOOD (  11.98  )
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

On 1/22/2024 3:38 AM, Kang Yang wrote:
> Add P2P support for WCN7850.
> 
> Kang Yang (10):
>   wifi: ath12k: change interface combination for P2P mode
>   wifi: ath12k: add P2P IE in beacon template
>   wifi: ath12k: implement handling of P2P NoA event
>   wifi: ath12k: implement remain on channel for P2P mode
>   wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
>   wifi: ath12k: allow specific mgmt frame tx while vdev is not up
>   wifi: ath12k: fix broken structure wmi_vdev_create_cmd
>   wifi: ath12k: move peer delete after vdev stop of station for WCN7850
>   wifi: ath12k: designating channel frequency for ROC scan
>   wifi: ath12k: advertise P2P dev support for WCN7850
> 
> v3: rebase on new ath-tag, use ath12k_ah_to_ar() get ar(Karthikeyan).
> v2:
>     1. add Tested-on tag of QCN9274.
>     2. update copyright in patch #1, #2, #4 and #10.
> 
>  drivers/net/wireless/ath/ath12k/Makefile |   3 +-
>  drivers/net/wireless/ath/ath12k/core.c   |   1 +
>  drivers/net/wireless/ath/ath12k/hw.c     |   7 +-
>  drivers/net/wireless/ath/ath12k/mac.c    | 366 +++++++++++++++++++----
>  drivers/net/wireless/ath/ath12k/p2p.c    | 142 +++++++++
>  drivers/net/wireless/ath/ath12k/p2p.h    |  23 ++
>  drivers/net/wireless/ath/ath12k/wmi.c    | 116 ++++++-
>  drivers/net/wireless/ath/ath12k/wmi.h    |  50 +++-
>  8 files changed, 643 insertions(+), 65 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/p2p.c
>  create mode 100644 drivers/net/wireless/ath/ath12k/p2p.h
> 
> 
> base-commit: 8ff464a183f92836d7fd99edceef50a89d8ea797
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


