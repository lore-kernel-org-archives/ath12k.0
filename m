Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F262C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 23:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgXTrurLzJRdosDMBnlpwll5gIJabJB9pAmfi6ml8HQ=; b=f3uIhGQK750XhYaRHTTiF+J/iS
	Ek10a9UuJc/4GDlBpUjtZIsi44abxV7TwCV+WmQlvVZjXx936OqjnenMfIjC9GwKxm4e4PR4aoYiD
	AYa2AvUB/4HEpqDuQS2wDSE5aB2S8KXqePwiHe22gvF2ebGdI5HEAp50qVALseHZsoovA44guwAtU
	u81CQW5uULrUoQhgNaU3QiYg4RPMGSo/Yy5VA4JYB3Rmbw7JzdeOsUqzdOzUtdNxvnmQ5YY3uZPdp
	2zxZUhfa11pGIJYbAqHT7UUhcjmFUpi+3AvhPgiB5GPr/4iZsyMdlFGi3bPLjuBB1e3CuMif3g8HI
	tGImVmpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s08eg-0000000Accm-42y5
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 23:37:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s08ec-0000000AccD-2ycY
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 23:37:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PKjKxh009289;
	Thu, 25 Apr 2024 23:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=AgXTrurLzJRdosDMBnlpwll5gIJabJB9pAmfi6ml8HQ=; b=dm
	GFWFqV09NyJnIzHC2v/JLTFmxVLP171dNFY2zlGKwBG6SUZrHinn7+Epqqpoty90
	c+KGhdSdRlt1cXVWDIzACSOseUdlV38wHRLOhtrDzsJJKKhQ7M/xr1fw4VMxSrIj
	pUpSr6tI33ihzeO/uqdV/nAW0gXhbWnESR1A/JneoAZsDJ3b28UAjkNvkY3uX/PK
	8ojFNsp7fnbn1MqVae1etEFOIaa1AnUmxO8bQAq2J1xTcuXj/POYH7Sp98n2vQSt
	xTUltSLPTKjbQCycAjXZ3tJzp+dQzCRFDYZywHHHIA4QTSUz/Y/rXp7GmNK5Rlke
	SJVbzrxZDw2eXSxlMBgQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenkkxb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 23:37:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PNbLn8019598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 23:37:21 GMT
Received: from [10.110.19.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 16:37:21 -0700
Message-ID: <e44b6394-f2ba-4291-8683-b37ab634047b@quicinc.com>
Date: Thu, 25 Apr 2024 16:37:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20240424201959.935-1-quic_pradeepc@quicinc.com>
 <20240424201959.935-8-quic_pradeepc@quicinc.com>
 <72bc6772-8bf7-427d-8f03-01e8dbf30d0c@quicinc.com>
In-Reply-To: <72bc6772-8bf7-427d-8f03-01e8dbf30d0c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: o0XFEIJgjQMrHdoiExbd7fX1WvZVGSEB
X-Proofpoint-GUID: o0XFEIJgjQMrHdoiExbd7fX1WvZVGSEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_163726_905876_CC10633E 
X-CRM114-Status: GOOD (  10.68  )
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

On 4/25/2024 3:32 PM, Jeff Johnson wrote:
> On 4/24/2024 1:19 PM, Pradeep Kumar Chitrapu wrote:
>> Add support to set fixed HE rate/GI/LTF values using nl80211.
>> Reuse parts of the existing code path already used for HT/VHT
>> to implement the new helpers symmetrically, similar to how
>> HT/VHT is handled.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
>> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>> ---
> 
> [...]
> 
>> @@ -7753,7 +8034,20 @@ ath12k_mac_bitrate_mask_get_single_nss(struct ath12k *ar,
>>  			return false;
>>  	}
>>  
>> -	if (ht_nss_mask != vht_nss_mask)
>> +	he_mcs_map = le16_to_cpu(ath12k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
> 
> drivers/net/wireless/ath/ath12k/mac.c:8041:22: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/wireless/ath/ath12k/mac.c:8041:22:    expected struct ieee80211_sta_he_cap const *he_cap
> drivers/net/wireless/ath/ath12k/mac.c:8041:22:    got struct ieee80211_sta_he_cap const [noderef] __iftype_data *

for this issue you need to use ieee80211_get_he_iftype_cap() (may return NULL)


