Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C126CD1296
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 18:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWU6sccQnN13eum/VxOMH0n3LI+3M3mUrhV4+7h09jM=; b=avc+89x+FwMX4KrCorpqZlf9f4
	Ob9+IV3lHmkHsysUkA+hApH+rztc20VGeCW/fyIJ/Ktiw5hkD0OxHKNTxvRUcZIN30bgT1zG84Ifi
	iFMwjohBIPS2bu7upTRNbayQLDQLmQ6fZckUFFcc0Lf671/3N5hHuNxIeQ+NlOsdZsVw6xm7jQBvF
	SeOFVfW9EhyxOurOE38doOZiBUiiWKCx/IptJ9nUGtKP3gmPM3f6M50U7KWUJwwrAnoM3bsa/PLWg
	xDRVtyNo1M8Jut3He/vI0/wujONyaJjO65ddHU5EQ8W8sB9qfudE9Cc2IPc6s9GLv6YyzaAsnaQ6D
	x0x0zUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5Aa-0000000HLZK-0cFo
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 18:17:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5AX-0000000HLXT-19jm
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 18:17:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4338TxGO005870;
	Wed, 3 Apr 2024 18:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=oWU6sccQnN13eum/VxOMH0n3LI+3M3mUrhV4+7h09jM=; b=oV
	2yz2jWHOeolr4+zjONRqG79mlXZCURqmUunS0QcXth2Ke8WALtU34kSxDjPddpKR
	6IXAx3DTn+tXTtJiCa6OTsWmiTk2Pty6M+TokroDXriw1d+8Vq+VolALHD/vrJDx
	cGlCAEaVCkK+olUvcOvxrE7vEiF9uv6EqiRHK9oUiadt3mUoxryRvS5MnkbiLB73
	Cx3agiieFhx37E8NIsx89kKqStsLzpWxtmwLzt+O9tLp1ynVzSKjXgrFQt0kKkS3
	Tqbtga1g+JAHxWD5yUuSmVLjUBvpQXN1TcFU0PKAkWNewuc8XR1jX/61NvCKV8nq
	RYFrbhHntbHQlePnTd3Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x93n3hgq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 18:17:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433IH3D3021197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 18:17:03 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 11:17:02 -0700
Message-ID: <1350297e-8b74-414f-82d1-8492c5cf5a67@quicinc.com>
Date: Wed, 3 Apr 2024 11:17:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] wifi: ath12k: rename MBSSID fields in wmi_vdev_up_cmd
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
 <20240402210538.7308-4-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240402210538.7308-4-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IVttWNBIwypHuGKthkw01L_NGL6on29K
X-Proofpoint-ORIG-GUID: IVttWNBIwypHuGKthkw01L_NGL6on29K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_19,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxlogscore=573 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_111705_476954_1644E02D 
X-CRM114-Status: UNSURE (   8.00  )
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
> Rename trans_bssid to tx_vdev_bssid to make it similar to vdev_bssid.
> 
> Rename profile_num to nontx_profile_cnt, and profile_idx to
> nontx_profile_idx which make it clear that these configurations
> correspond to nontransmitted MBSSID profiles.
> 
> These members are currently unused in the driver.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



