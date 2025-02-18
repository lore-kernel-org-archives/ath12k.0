Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE3AC021AA
	for <ath12k@archiver.kernel.org>; Tue, 18 Feb 2025 21:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNqR930C4CnK824An0yd34Tx7MRifk807WJETRzoTUc=; b=bYCyYpB4cnlBPKeyfk/rPL+YbI
	5ZpqORX78+3WxBoldc6v2RtwzC+pJxZtt888iut8pWiT+IAvNWWLo3jwn9mQqFI2GWxrJ+scNeD4X
	QhDgsSRs4fqGDekecpdJPsDIjBfMXnlY83gkRDZWOzS/53pwqze4iG1niCfeCTMkSvrW8WDbGeN9T
	aTzAjh69kfrJDkZldxXBG5QnL88FPeFsvDHnCSMLQJPtWtiRM1Mw5Ki9dYLPP69N/uMjIc9d0XKuP
	LzC6qJTLf0ztPTZVDGCuQolyjTFklc2DDI45oiH+LrE5cO1po/BoP4jlEKxanC+ke6c6f6kAwtzBE
	771hngKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVEr-0000000A19o-16pY
	for ath12k@archiver.kernel.org;
	Tue, 18 Feb 2025 21:34:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUo8-00000009vpF-0OGU
	for ath12k@lists.infradead.org;
	Tue, 18 Feb 2025 21:07:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIwKJm001819;
	Tue, 18 Feb 2025 21:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNqR930C4CnK824An0yd34Tx7MRifk807WJETRzoTUc=; b=JdwPBw5RAbHoZazo
	bk1PoYxDeFmbaLKzUSsQJZxiGsDX/CP7NiHT5jIwZanbON0lScGioLmY0ZjQgnZD
	t6Q4jQhj0UxZn3AOqJZqzUIOQcPv/NDdggKNjh8hXLAgn3Q7ubiCsHOOMCmKyRDX
	Ol+EZQWnYol0M9V1qxb88ExN0Tzy+BieTx2jfFs/4jVN808B05nVF0laKH7IKOS4
	pU6KxB2bhQ5neLJ6hDRRHuL6iHd4h5X+Ohu6T0VvRbeCR+YKvUePkfW4Kvm4O8UN
	rvoGuW7nU06PjhIGGRaIzv4suMLLYbPSdp/pC8fX1XbTOQQXNlGK2NwCkD69jUod
	v3cynw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy289my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 21:07:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51IL76Xm013056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 21:07:06 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 13:07:05 -0800
Message-ID: <d22383c8-642c-4c47-8d4b-c145d1ca5f70@quicinc.com>
Date: Tue, 18 Feb 2025 13:07:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 1/9] wifi: ath12k: push HE MU-MIMO params to hardware
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250213012439.278373-1-quic_pradeepc@quicinc.com>
 <20250213012439.278373-2-quic_pradeepc@quicinc.com>
 <73645538-06c2-48b7-a95d-9e47b06674b0@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <73645538-06c2-48b7-a95d-9e47b06674b0@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HfZXvtdUTRUPqpIk3vaWOM9nL4_QPgCb
X-Proofpoint-GUID: HfZXvtdUTRUPqpIk3vaWOM9nL4_QPgCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_10,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=942
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502180142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_130708_135436_A784C103 
X-CRM114-Status: UNSURE (   8.29  )
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


>>       ret = ath12k_wmi_send_peer_assoc_cmd(ar, peer_arg);
>>       if (ret) {
>>           ath12k_warn(ar->ab, "failed to run peer assoc for %pM vdev 
>> %i: %d\n",
>> @@ -3873,6 +4012,13 @@ static void ath12k_mac_bss_info_changed(struct 
>> ath12k *ar,
>>           ether_addr_copy(arvif->bssid, info->bssid);
>>       if (changed & BSS_CHANGED_BEACON_ENABLED) {
>> +        if (info->enable_beacon) {
>> +            ret = ath12k_mac_set_he_txbf_conf(arvif);
>> +            if (ret)
>> +                ath12k_warn(ar->ab,
>> +                        "failed to set HE TXBF config for vdev: %d\n",
>> +                        arvif->vdev_id
> 
> So when you bring up AP in non-HE mode i.e HT/VHT and all, this print 
> will appear which will be misleading.
> 
Thanks Aditya, I agree with your suggestion. I will make these changes 
and submit an updated patchet v11. Thank you for your valuable input.

