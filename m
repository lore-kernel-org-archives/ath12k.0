Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA6EC47422
	for <ath12k@archiver.kernel.org>; Sat, 27 Jan 2024 00:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkXNXGewLkSwd4mM9yX4CC35BdWPH8+PA49o70Klfmg=; b=mDv5zat780t/HpJk9Z9vk/8Dv7
	xpWNWgJ5x0P/CJnduRBRLTe4VDTnaYYPIQmV7EhaFzyx9jMJ2fa6W5LoRdk9NgnKayBWfztvF07oq
	hvEDw3JoxzDOWVEAmfV8/IDT6nP/dY8mUnVEWGNkc+35/wZO+zwRp0+vh5pVDsZ6ftT6SPFiWL0iV
	xUzs0+K9lJrzof1V2gN24vORlpt67tTPdobdcniQgKlrx/VpaD+plojdz3kDmx8oJGRnL9JK039VV
	Q+VBScgWEeDGfsREc6d1DwYh/xGvDjQVAJbqL7ZrxWdv2RXpXHE0tu/2Su5I3Zzw09BfV8Oq9O9tR
	p8QoIFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWWh-00000005yUh-3TO2
	for ath12k@archiver.kernel.org;
	Sat, 27 Jan 2024 00:26:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWWe-00000005yUB-3db3
	for ath12k@lists.infradead.org;
	Sat, 27 Jan 2024 00:26:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40R0K1JY021212;
	Sat, 27 Jan 2024 00:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=pkXNXGewLkSwd4mM9yX4CC35BdWPH8+PA49o70Klfmg=; b=WD
	ST7i/kebNNGhjJymUXz/eGpVtMCgp6sfnAJeVKYWuF2v5hgeUwThtmfl5HWtDc1g
	NqIpDpqM7ceKqt4fyqMfeGh/hwZ1fMQbTxVBC1ErT1nQRq2Ul6POKcs/taKLBrP5
	scL5SNix4BV89JNgqVHf3VXZjUSF/DE8S3kQuqzhopm4wjBADHUwlK5CCuYGVBPD
	rge7JjsglNh90QiFmaDaxTi6/UGxQFXAE0fKRTDnn0Y+s6rIZ/vLNwR11V8rogyy
	EN5l3Wcmd4YE2IeoZol9YnGKHeAyHzHokUcFAlQfqodYpjXIfqRNeqEAonJKSOzT
	uBk5V/KFRo16r3qWQsbQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvq6sg0au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:26:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R0QM6p012900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:26:22 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:26:22 -0800
Message-ID: <eb8d93e8-ac2d-484a-b97c-4eb21fb74d1e@quicinc.com>
Date: Fri, 26 Jan 2024 16:26:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/11] wifi: ath12k: designating channel frequency for
 ROC scan
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
 <20240126115231.356658-10-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240126115231.356658-10-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V-t0whNYYwynU1Nrce0-uEUnfysYN--w
X-Proofpoint-ORIG-GUID: V-t0whNYYwynU1Nrce0-uEUnfysYN--w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=853
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401270001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_162625_063360_F406B3FF 
X-CRM114-Status: UNSURE (   9.00  )
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

On 1/26/2024 3:52 AM, Kang Yang wrote:
> For P2P mode, the WLAN interface may be requested to remain on a
> specific channel and then to send some management frames on that
> channel. Now chananel frequency of wmi_mgmt_send_cmd is set as 0. As
> a result, firmware may choose a default but wrong channel.
> 
> Fix it by assigning chanfreq field with the ROC channel frequency.
> 
> This change only applies to WCN7850, other chips are not affected.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


