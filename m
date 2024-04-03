Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672DBCD1288
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 18:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9M3Qn0EuIcdC2HRRa/RV3G/cIedAwMvCJxX4WPF+Us=; b=r01CPXV+pr/50xuudqFtB8L4Dz
	qJdnP9wRpMZh5wStqkR4Y2y65p8e1GT6H8E5/S0jy5sFhBbzJHqxauaxDHSD0EtvOIHoolrREACZm
	OXMAICNwLv/jZHr+Bb6+KyXbsJWMeS+lDKZkKUH6yxgd65W4mTlDTkasFS1OMsR1zhWEO12Z7Nwy+
	p11zu2xvondqTOuvBstK6Mbpy++3KRcG4p98UQzWNJ/1XabwUgDCg/JUg5X0G0xipfUhXP23Tew4c
	VUA8av+pp20SsBZ+V591gaRv0rYeWTvZR68z6kVzSJFh8xr6OVHVTXBjf15+g1FSDYUy/2ViD0upX
	iX+nwE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5AX-0000000HLXi-3sn2
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 18:17:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5AU-0000000HLWE-2Wd4
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 18:17:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433EAhgR019132;
	Wed, 3 Apr 2024 18:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/9M3Qn0EuIcdC2HRRa/RV3G/cIedAwMvCJxX4WPF+Us=; b=ZK
	zo1Aj94LAw+v1/mP/eiDYFUqTuoh4i2qwmZ2ScSBnJiPk3l0kTrPlab2pUpbTqW5
	pUNkVGCRGLbXqhakMaFcr8/wMe9mG38YeSFxVTW31Gb/UH4b4BNbDtWknm8tFK9P
	hnEFdqifAksim7V/XfuNZSp4rE9VM9NfwXDl1uomKqvzC44VYuzFE2BC0jhur1va
	VVbIBCC3Ym5LqrOIDUw4WJ6vv0M488knuDk8UsJ4mjSoCFi8yZKJi51HIgL5der1
	JxfGRd01amHLtZ7btVaAuVsLL3yHpuhGzIJGS3usByiyxaTkJq0kUBwMba8qiYMN
	XIC8u0eQGCDcP980gumw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x93pw9fc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 18:17:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433IH0Li021109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 18:17:00 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 11:16:59 -0700
Message-ID: <c3fbfb5b-aa5c-414d-98b4-64324f839df6@quicinc.com>
Date: Wed, 3 Apr 2024 11:16:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] wifi: ath12k: configure MBSSID params in vdev
 create/start
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
 <20240402210538.7308-3-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240402210538.7308-3-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1WsL3pZtASGfPshNu_nIuGRNSYaXRYXs
X-Proofpoint-ORIG-GUID: 1WsL3pZtASGfPshNu_nIuGRNSYaXRYXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_19,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 mlxlogscore=787
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404030122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_111702_722848_D54E1560 
X-CRM114-Status: UNSURE (   6.37  )
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

On 4/2/2024 2:05 PM, Aloka Dixit wrote:
> Configure multiple BSSID flags and vdev_id of the transmited profile
> in vdev create/start commands depending on the service bit
> WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



