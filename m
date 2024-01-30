Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E6CC46CD2
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 16:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lcFIP57dwO2cmUlaJhC/Or/CCyRCQyFFe8KBceXjIU=; b=fTH42/102iBOVqdvI8sd8lbZNi
	njvHVq8kKbyc7ZW4m3z2/OPxqy3TTIKPJ07ocgsgD4R17a9L6+cV5fBbeu9uuzvTh+ARczl8UwqyV
	nTjuXbaty5i37fvkh4ifhMYobIQach0KXRvi0iTx8ouHdyMF67ShV7ahEiMZ1ya2cOK9eBv/U2j0/
	it10DraEMN1zvE8FceH4GL+UnQJukFDDdNKczjviZ3N04E7Ir8jhsP0N5ChSgt3IrVSer6OhNmhuM
	YebfAa/d2WM3ZH2ZMI36hKAMPYj8zcMdkUVJlaqZ9IMu0QJYgk85nste6R9r7hOjY2OyEYjf0Io89
	rGaXNogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrHw-0000000HRbX-1voC
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 16:48:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrHt-0000000HRb2-2Egj
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 16:48:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U9fgmB002419;
	Tue, 30 Jan 2024 16:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=6lcFIP57dwO2cmUlaJhC/Or/CCyRCQyFFe8KBceXjIU=; b=mq
	pO7oYEafFUvNIEEARhtMSe6YyOQQxt0TNzxL68KDtEa+ZERjQ8FKibr3TPrFOFwk
	/BUimB1aPKgQNs+JEJBMXd7/7pTW4Y8KC8npO76A3wuAkJOmUuBGaQ1MNYfLMksh
	m51AQR5ObbazRYkb4Wt7d+QKM5azupAKKuwHFbmANIhB52mz0+9LIO3jiAKW3Dnn
	sh0w0tpBtRRjCzp3LpWP9/uKugurczI0EALB6JHlcAzUOdYKMwW+JxZYzMwGhKVU
	TwQXSXZj1U5SiIuV3ahZAwXmLoF4S72ZW7bjU/DIJJZ9Q8DU0VVwCRRlnugk1Deg
	K+aRaTI5fkgPHaFVYAsw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxvwqs87p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 16:48:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UGmcUg029055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 16:48:38 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 08:48:38 -0800
Message-ID: <6e302c5f-0bb4-4c24-b2a6-708db8118cd9@quicinc.com>
Date: Tue, 30 Jan 2024 08:48:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] wifi: ath12k: fix broken structure
 wmi_vdev_create_cmd
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-2-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240130040303.370590-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8Ro3g2NzOTFYhGiI48C4elO0v3Q1hTHX
X-Proofpoint-GUID: 8Ro3g2NzOTFYhGiI48C4elO0v3Q1hTHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_07,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=612
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401300124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_084841_727126_80B91F2A 
X-CRM114-Status: UNSURE (   9.10  )
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

On 1/29/2024 8:02 PM, Kang Yang wrote:
> Current structure wmi_vdev_create_cmd is not matched to the firmware
> definition. So update it.
> 
> And update vdev_stats_id_valid for vdev_stats_id.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Note that if you respin a series, and if a given patch has not been
substantially modified, you should add any previously given tags to the
new patch since they are not automatically carried forward in patchwork.
That saves the reviewers the overhead of revisiting patches they've
already approved.



