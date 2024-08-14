Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CB0C3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 18:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLNiJmfcTB0/qV3Gx6fRNaSc8lttrODzxrMvl9Ky14c=; b=EdEhc0m1of2RdOzs+ztr+ASopc
	/sD5qTE2OUtzGG+fPS0gQin5uR0gah54XVJAnqXCHkUGYZS5TnriB7R8hbAkU2ny/2zvI9cXqH35k
	JN92ylVcKRKhCifAEwRcp23q3Y/AqqYQ/LtxyOjldZ3kQmpcjSuV4lcNiK2snHFiWsNB6EJp0+gwl
	Lmx6LPDUWDOkbXa5I+kv/LjD2di4ApO0Y71J6oFxumyGvEa/anul/vgSzel1s4b65rgJeCdZtDc6M
	MkWr29QVtSAdwit/a8eb6/x6Iu7ONOlvbBct/BkjIyzTw8l8ajkss14YfYJUmYGQWKqHXttrBiWFT
	fXlVG8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seIsq-00000007x9B-1780
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 18:38:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seIsn-00000007x8I-0qc9
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 18:38:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47ECXoxR016991;
	Wed, 14 Aug 2024 18:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLNiJmfcTB0/qV3Gx6fRNaSc8lttrODzxrMvl9Ky14c=; b=pfCmW2Hk96c2apPO
	EieqDbm2lGcWxDL6HikH4Q8sOeXWEB4kiLV5YY4tXQQbClM8UIi/lnP6qw9bZaHn
	VGFNRGvQrVan/oe5I1qCAZi6cnK9OP/yA/cfAVYGxJWpsTrB6Iw0IMGvfVk/eVFF
	zI9fdBlW1yZxMiB+ckeKiI1xDCNzhtPYHITI0ijeaz1OAmgo7BbAWNnRkmq9ad0o
	8i2Y5pIpgnxCFkSBufW5oi3S/G3Yfjm6+5JVrgTVNJKbTHzPccjuyTnP6Wi3Q3yw
	94jcP5f6FUN9u9HLZD0XIjg2Yps78lh5XyOrx36rwnwbwzolUucOLc3GyO6KMDul
	gK8RvA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410kywjf0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 18:38:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EIc3KD005124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 18:38:03 GMT
Received: from [10.111.178.117] (10.49.16.6) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 11:38:03 -0700
Message-ID: <a5daacb9-1895-4f63-87dc-a4ac204e37bc@quicinc.com>
Date: Wed, 14 Aug 2024 11:38:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: Advertise multi device iface
 combination
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240814103423.3980958-1-quic_periyasa@quicinc.com>
 <20240814103423.3980958-4-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240814103423.3980958-4-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 56EHr85w5AFgCPjchbUCvNnpfKzZU5gz
X-Proofpoint-GUID: 56EHr85w5AFgCPjchbUCvNnpfKzZU5gz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_14,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=730 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_113805_279938_96ADF652 
X-CRM114-Status: UNSURE (   8.77  )
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

On 8/14/2024 3:34 AM, Karthikeyan Periyasamy wrote:
> The prerequisite for MLO support in cfg80211/mac80211 requires that all
> the links participating in MLO belong to the same wiphy/ieee80211_hw.
> The driver needs to group multiple discrete hardware components, each
> acting as a link in MLO, under one wiphy. Consequently, the driver
> advertises multi-hardware device interface combination capabilities
> specific to the radio, including supported frequencies. The global
> interface combination represent the combined interface capabilities.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00183-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


