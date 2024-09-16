Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9CCC3ABCB
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 22:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsPE/Td9F5KYxBf+8SfUI5CxgVUKhzcjvMbJjZONz8U=; b=oh/yfXPyYAajkKeEYDMgO64rBI
	LIpWORSw5X8pPcvNfgVn1zqvu3EkM9Bm/+/n+3j8uhqkt+71EKAJWdoF8Gns1o3kBy6EHkgcBNWuV
	0H+eAhCVnt/UikZBE07bkKFGGGEU3kRsUTu0jA5pXBYAxVbLvw5nqMHQGXs8GdY39AaYZZdY3VjQh
	p4ByYiod4gwCk9hf40laQJe81n9YyGkiZjdgGU8kBTyP54JMUNsQsPeTELqbZX3NskOHf21ruUa3Y
	mjdF0FvYZqEuVUitblizNsbN7Rx7l773IXy2pbFk/4OUXiUt09w1bosTt2beFQl5ABGMMv1FWQFV9
	h/zP7O8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqJyh-00000004yj7-0tPT
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 22:13:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqJye-00000004yiO-2kEj
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 22:13:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GCcjXH014288;
	Mon, 16 Sep 2024 22:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UsPE/Td9F5KYxBf+8SfUI5CxgVUKhzcjvMbJjZONz8U=; b=ZYT+YT6U1UVJVFty
	aCOuqAGKgfNws2NVbAcVs/4UGeqUDRpVHnDtjAxusDbnY7K9XMz6nPlbibgacTzQ
	FQKc1inyWn0cZTKM5Fs5ykMWJN/dino15LSW8XVPAkqpcPkueCp5IEY3qWSI/S64
	zhj2vwfy4KW3XPa+8SpzNJVyKbo/ZpKFnqX8RJ5/uADUgxgt03R4Bf+hA6lOxZp3
	rSfInhmSyQ4HCMISskUUmS95RAn7z9zKtK2GxYKRdyADNStVrKgtcEu6EuMRUkHr
	aoJ2hJxoMFWr5cCYVPjzM0orgulqF2Gc7f0NKr8vY1FXhI8LjwJOc5T2PH1WqtB4
	rP88ng==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4j6nc2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 22:13:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GMDkau004817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 22:13:46 GMT
Received: from [10.111.182.118] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 15:13:45 -0700
Message-ID: <2eff7510-3f48-4564-8bd7-9a48b248a3fa@quicinc.com>
Date: Mon, 16 Sep 2024 15:13:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] wifi: ath12k: Support pdev CCA Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240913082949.573482-1-quic_rdevanat@quicinc.com>
 <20240913082949.573482-5-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240913082949.573482-5-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i08cZcacA9YMS1TJ39GCCk75pC-F-kKg
X-Proofpoint-GUID: i08cZcacA9YMS1TJ39GCCk75pC-F-kKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=801
 mlxscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409160151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_151348_842824_A2EF724C 
X-CRM114-Status: UNSURE (   7.49  )
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

On 9/13/2024 1:29 AM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request CCA stats for physical devices from firmware
> through HTT stats type 19. These stats give information about
> channel number, number of records, counters' bitmap, collection
> interval and different CCA counters.
> 
> Sample output:
> -------------
> echo 19 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_PDEV_CCA_STATS_HIST_TLV (1s):
> chan_num = 5955
> num_records = 10
> valid_cca_counters_bitmap = 0xff
> collection_interval = 1000
> 
> HTT_PDEV_STATS_CCA_COUNTERS_TLV:(in usec)
> tx_frame_usec = 0
> rx_frame_usec = 0
> rx_clear_usec = 999955
> my_rx_frame_usec = 0
> usec_cnt = 999955
> med_rx_idle_usec = 0
> med_tx_idle_global_usec = 0
> cca_obss_usec = 999955
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


