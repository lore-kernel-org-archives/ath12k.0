Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E1D59F52
	for <ath12k@archiver.kernel.org>; Wed,  6 Nov 2024 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMOePaAHl4oSF5HDSSYsZ7ALL7+g/tu5mqHBdwudZco=; b=rPmR9K3dO9cDYFahABPM7tfKso
	X1SYAWV2Coe1XCkMs9wdgQNXg0liIXB7pPZW6/fP462mEmwwqcv2okYDmowC4R5zW+LcmCe6I4Qfj
	XcMJI03MbDqXhcudJXs0f+86u0pZsE1+J0mluMmFFGwZE8PnJbll7SfRzvnK/JceBiUc1VrsIjK+3
	JXQbWQoB85zTzNOiO8/jg4RVUTuCGblZEMUzMHxbI4ezKLzFmCf+5DKnttPiXMxQ/OiqxKywR0Ene
	xeEwM/F0Dei8RafDjMKXCboq/2VXFAByYDsUhrX6/n6PxiWeOaH12RaQ8Axd+stEKlHlBi8tWpJ/N
	UboiVtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyO-000000042Zo-3xaR
	for ath12k@archiver.kernel.org;
	Wed, 06 Nov 2024 16:33:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iyL-000000042YJ-2haU
	for ath12k@lists.infradead.org;
	Wed, 06 Nov 2024 16:33:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6GDdv9010715;
	Wed, 6 Nov 2024 16:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMOePaAHl4oSF5HDSSYsZ7ALL7+g/tu5mqHBdwudZco=; b=B/BtWv9tJUpCL6iZ
	UCPJaqZdPPM2yCZbWK4gRATOHPndufgASy5ZvaDr8vzk3hpA689r29i2MY6/90Gg
	KxPWzMtgIkSSrXOJRAGavte/oH0PzmIWvxShbEreRMng7KlHdqE2ZWRoUwQnhx3h
	eDN7DGhD0wwMZM1R/VNiNfQ5PMqeaXl5MqvArx0VC6XOOXZmVxn2Rpf0LhIbaVvI
	4JdY0sKeroXr7cI3/AUzIDnR1pK6jUs3JDSn4THm08QscLV5STf6f8lD/e5idzRK
	AYFmg+cvMYMYxMIqlD26ADSR6BcelSQqbggnhqvqtWQzzS+wtrQT0yu3RACCKZ7C
	nIDYMQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qn73bnd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 16:33:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6GXUIg007942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 16:33:30 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 08:33:29 -0800
Message-ID: <37265dcc-643a-4879-8d08-bf6bf30e8042@quicinc.com>
Date: Wed, 6 Nov 2024 08:33:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] wifi: ath12k: use arsta instead of sta
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241106142617.660901-1-kvalo@kernel.org>
 <20241106142617.660901-5-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241106142617.660901-5-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: l9va_C101pryWwUWXGYNb_K_EFo4Wttv
X-Proofpoint-GUID: l9va_C101pryWwUWXGYNb_K_EFo4Wttv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=901 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_083333_723416_9E945CAF 
X-CRM114-Status: UNSURE (   7.64  )
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

On 11/6/2024 6:26 AM, Kalle Valo wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Currently, struct ieee80211_sta (sta) is used for many WMI and mac80211 ops but
> for multi link station, driver should use struct ath12k_link_sta (arsta)
> instead of sta. Add changes to use arsta object for WMI commands and other
> mac80211 ops.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



