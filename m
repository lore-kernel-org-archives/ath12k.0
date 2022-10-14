Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAB1C4332F
	for <ath12k@archiver.kernel.org>; Fri, 14 Oct 2022 07:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:CC:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxrTes/jdfvrvYLOvSbSXLrVt4InATPvLnuL54wptTI=; b=gwh4Tig6BGVh9n
	PMEH9HVw/nU5zsl+DJaCEGFUrH0XuU9aKAAZW9vLyqBaOlvl6tbDEK7a2oyOSO3deUy7St+vDZVab
	mEnExgOG5W+/74/N9rCVrzTPlqPxnyVWzoehWnHtzIK3m6NyWGNe4tuYVTJhm/ua3DBbFliAKaIUJ
	L0/p1rCX/YS9iZamrfT0ENhcoLftOv1QHST3GwrDTFqHOxQsHdI2OhM+zZHbjB9lOGldp8MHRKhYV
	sqhdHArlox992+l8AM0WN1l/XAfQWgGz/iNZT3/ZVol18v1/Ln1hRv1xoLVbSu/SamTJ3SGopY6iX
	o73boFKYSaeS3aGMltFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojFRe-00DxGJ-1C
	for ath12k@archiver.kernel.org; Fri, 14 Oct 2022 07:49:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojFRb-00DxFt-9H
	for ath12k@lists.infradead.org; Fri, 14 Oct 2022 07:49:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E4jVjo004104;
	Fri, 14 Oct 2022 07:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : cc : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8r2oo2A2ixBsNsErHkai2QpmPWppB6Numquw4jhaWNQ=;
 b=AGIVItbQtZXuDZAO+U5EEFkNY8o65BRjbHPDgAjUB6INMg4zJD3JJ4p/0KUmh+UBpSLs
 30nXCu6lGq2AVKWynQENQPmPcz4ZpQo5Z5nIYXcZQzUZ16OkMJMi5P0G6xhQy4ljwzrB
 sF+hyiKSdiEJr6LEOp8HtXc4kkWdCXCn6mzx1L6o1lxoeb+YP0IVZ1dpiUAc/vGcIacA
 7U+4ibeZqR+7sVt5Tke621aXevrbiqFbhddxtU19mIiGk5Kgl362r+qlSnpanBKJeBHn
 m0oGZ2GO1QTIXeK7KOFNxyT7F8i3jTN0J/u52g9NTVFRggAVTVdmOYegmCX9yBV7Ujoj Qw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k6smp1e0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Oct 2022 07:49:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29E7nHh4018764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Oct 2022 07:49:17 GMT
Received: from [10.50.44.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 14 Oct
 2022 00:49:16 -0700
Message-ID: <83fe4c4e-c8e2-c873-b4af-42d1bd6787f4@quicinc.com>
Date: Fri, 14 Oct 2022 13:19:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 17/50] wifi: ath12k: add dp_tx.c
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        <linux-wireless@vger.kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-18-kvalo@kernel.org>
 <de6d5e1a-0ff4-a303-ed25-508816a39a0d@quicinc.com>
 <CH0PR02MB821206158809DF78955A0EC8F6249@CH0PR02MB8212.namprd02.prod.outlook.com>
CC: <ath12k@lists.infradead.org>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <CH0PR02MB821206158809DF78955A0EC8F6249@CH0PR02MB8212.namprd02.prod.outlook.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GruA0i3NTKFf4O-p2T1b6pTGFuKq7vbM
X-Proofpoint-GUID: GruA0i3NTKFf4O-p2T1b6pTGFuKq7vbM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_03,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=892
 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_004923_388924_490F6C2A 
X-CRM114-Status: UNSURE (   7.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


> snip
>
>> +int ath12k_dp_tx_htt_rx_monitor_mode_ring_config(struct ath12k *ar,
>> +bool reset) {
>> +     struct ath12k_base *ab = ar->ab;
>> +     struct ath12k_dp *dp = &ab->dp;
>> +     struct htt_rx_ring_tlv_filter tlv_filter = {0};
>> +     int ret = 0, ring_id = 0;
> nit: both initializers always overwritten
Thanks Jeff.. I will address all comments in next revision.


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
