Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFF1C27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 18:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVPPhwzFhSjzBWrLr0/VoLhH7Ttj1NrzFNv+6VmtY2M=; b=yrkAj3Wb8sMLVuPamJE8mQQ3BV
	8UUUy8xLocZgOOp546cU5HBe4IChp+ysqULywjEhL+uGwggwscuOkYrq8kFDUyukI0KAEpTvkkPjx
	zXcd4+nblIIyFdorkZYq47ISxT7xKJWSmWdIV8hh9jFxxJJ4wy+o8moi8/Ahs/jOxfiBK0vd78eZi
	Uqb4rlv0b4VOKGPee+eJ8M6aYksCujKCvU8Z7AE3glhHCVZNRcWqYJCJBvRuX7lNygcXbiz/9Fxiy
	eBzWkj9jIvEhd40dYwV4b3FCjh99mMrNc+5pbJyyFZuFfKLE7YvawqmbdvALijvIU13yHIRxCDm8I
	iHSA1+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJGlv-0000000C5fO-2QAg
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 18:08:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJGlo-0000000C5cv-25Lq
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 18:08:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HEhuO1030652;
	Mon, 17 Jun 2024 18:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vVPPhwzFhSjzBWrLr0/VoLhH7Ttj1NrzFNv+6VmtY2M=; b=QP1btKqIZNP2/s6z
	srIvj9fOHlVb5kkdcYj2zMgWKLthBnqZPxR0ADz2XgaItuuSHID3O/3snO1HboyG
	L4adwA0xIK0CFqZanPqFbdEuWP4b0D+QRzuJzzn4/8Ibs9mBJUl3KG/OhP1wKqiv
	42iLzLFGlzv+DOZF5XdPq/Od/w4dMEheWmdxY5jHQ/Xy26yFRyxL8PHvv+8YHsXQ
	LptDIjSJTbKsifSagFKtd4EdUNVXKfBiqKxy0PpFj7HVA1txb0aQiEBcrk9Y822Q
	MvxJGEjvTtOE68bjoBMmr4+9ImWbjZzOpQmUWJGqxkNynrA83MH5Gp8J+NCYVKwN
	G6xxMQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytfut1ke2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 18:07:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HI7sx3005366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 18:07:55 GMT
Received: from [10.48.243.231] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 11:07:54 -0700
Message-ID: <a4f466a3-9839-4591-868d-fabd668030b7@quicinc.com>
Date: Mon, 17 Jun 2024 11:07:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix mbssid max interface advertisement
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240613153813.3509837-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240613153813.3509837-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: x6OCStTPxMSNrhoJ3jY5aasbYYNEVG0-
X-Proofpoint-GUID: x6OCStTPxMSNrhoJ3jY5aasbYYNEVG0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=657
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_110756_630711_E5C771A2 
X-CRM114-Status: UNSURE (   7.25  )
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

On 6/13/2024 8:38 AM, Karthikeyan Periyasamy wrote:
> The Current method for advertising the maximum MBSSID interface count
> assumes single radio per wiphy (multi wiphy model). However, this
> assumption is incorrect for multi radio per wiphy (single wiphy model).
> Therefore, populate the parameter for each radio present in the MAC
> abstraction layer (ah). This approach ensure scalability for both single
> wiphy and multi wiphy models.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 519a545cfee7 ("wifi: ath12k: advertise driver capabilities for MBSSID and EMA")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


