Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDDFEB64D7
	for <ath12k@archiver.kernel.org>; Fri, 16 Jun 2023 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0K47AQyU3Qr+gndbYOWoUgRBDrXrSe4mnIPg7qmLAaA=; b=vvVJ23rlyHwrji
	thorvlrKqtzvqr8FaGU6VAQLdcuUEtO2nJ59K+LjAhzCsLAz23dh6wjmC+nA5lh0YlKc9j5a1i1OV
	N1RlwmBOrKPHGGmG1n9D7A3W26arBsu2QZkNMJfpcJpaN7XTwuCaUz0zSJ+EbKZwkG740QD6tcbFU
	wCWBlqpYqEkBTOuZ91FkP6ph/9z77Zx8G7aLYnYB1o19D32CleccN94HjxWmt4te4OTK+jOG1vrJ6
	ur/ly6P5U1GoM9MSPeKcqENtJFxhxmEWVbJ6Wbe455WvA0kSelTqP+nTkYKMnEu73OFqsgMIunn9n
	GF2u1/X3KVYEPyB3lguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA73I-000Cji-2G
	for ath12k@archiver.kernel.org;
	Fri, 16 Jun 2023 10:51:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA73G-000Cgb-0R
	for ath12k@lists.infradead.org;
	Fri, 16 Jun 2023 10:51:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GAYG4c024610;
	Fri, 16 Jun 2023 10:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wkMpMoQjJg8oALhQL2wffy5wdDB1U3WP2abIHuWqIDU=;
 b=QgcDg3Ic+z048hVzkpbfUWuoGdln3gsr613HngUme3hFGWDNRIlVFzckeaGyRN16CAgF
 vOmNUsL7YG/LJuHyu0ZWAJ3AJBIXpY7N08pBuQB3ZbADvBy9XH46Ks0umqa27BgjouvV
 u1zp5lU8Xpmw7D7c6ktOZMtiPgfEsLybBQEhCSwpxZuEjWS/dt+KxVd3+iUE0slIi2R+
 Qxvc8FPnMZske8FlkIHFEAd+O/O4walldk2e5A/QKGHqFpTOInijEyh7olkDsnLOTa9M
 R70b2BElPlApqApN/PIOR/2LKLw9+YZ1MCHkBVk05Aww+RDyThOyatjcTlAKbQGcEEhd 8A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r8j2m0hby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 10:51:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35GAouPv015584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 10:50:56 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 16 Jun
 2023 03:50:55 -0700
Message-ID: <844a2d71-d003-abd0-4cf2-f279a1b62ac7@quicinc.com>
Date: Fri, 16 Jun 2023 18:50:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 03/11] wifi: ath12k: WMI support to process EHT
 capabilities
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Aloka Dixit <quic_alokad@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Pradeep
 Kumar Chitrapu" <quic_pradeepc@quicinc.com>
References: <20230602235820.23912-1-quic_alokad@quicinc.com>
 <20230602235820.23912-4-quic_alokad@quicinc.com> <87ttv9aqtn.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87ttv9aqtn.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xyFk06bKD-mv5hFNI6Wcrl6lvcCJAi8N
X-Proofpoint-ORIG-GUID: xyFk06bKD-mv5hFNI6Wcrl6lvcCJAi8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_035134_312888_5B04D004 
X-CRM114-Status: GOOD (  12.84  )
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

On 6/15/2023 7:49 PM, Kalle Valo wrote:
> Aloka Dixit <quic_alokad@quicinc.com> writes:
>
>> Add WMI support to process the EHT capabilities passed by
>> the firmware. Add required EHT specific definitions in
>> structures ath12k_band_cap and ath12k_wmi_svc_rdy_ext_parse.
>>
>> For single_pdev chip such as WCN7850, only one pdev is created
>> and only one hardware is registered to mac80211. This one pdev
>> manages both 2.4 GHz radio and 5 GHz/6 GHz radio.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
>> Co-developed-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>> Co-developed-by: Wen Gong <quic_wgong@quicinc.com>
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> [...]
>
>> +struct ath12k_fw_pdev {
>> +	u32 pdev_id;
>> +	u32 phy_id;
>> +	u32 supported_bands;
>> +};
> So we have now two very similar structures, ath12k_pdev and
> ath12k_fw_pdev. It would be good to document above the structs their
> purpose. Any ideas what I could add?

For single_pdev, the ath12k_pdev is always one pdev.

and ath12k_fw_pdev is more than one for single_pdev.

>

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
