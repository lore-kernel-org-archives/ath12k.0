Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420F7C001DF
	for <ath12k@archiver.kernel.org>; Tue, 25 Jul 2023 10:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htPKp/AK5U1PZ6VUbpt2mBMUk/Av8C9994094+gwLD8=; b=jEiXrqrKfTKWFf
	CggoC1Gv156/RNyMsPTwNwXykOCBrONJQ+pGZY/KNjoY81K0aFDJ/HrbkWI+/TEpln8HCmeJQ+dXI
	CIu0103vcujohxrzk53nR07IMPqc7PRRsQWn8+bZBZ9Ewyfv87P6aIAvGVjU02fnquD3v3BghCd19
	g5wqUVmWJyHVo9WoJXW5w/Cedux8lm/nwc7X2/hKpzlmxMsHEBLtgEzRZWESlgEPEiptg/2ZpVUbt
	vouw3r59Pa71Ie/bjlMyORY9HO5wxxMrDOJa0N51MT3xUuzDpB1+8bCWmRe5GHgIxtGNjt0ugLk05
	00A6tZNunyFPNlGPBpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFdf-007EOR-33
	for ath12k@archiver.kernel.org;
	Tue, 25 Jul 2023 10:51:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFdd-007EJD-0h
	for ath12k@lists.infradead.org;
	Tue, 25 Jul 2023 10:51:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PAVQ9R011949;
	Tue, 25 Jul 2023 10:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KBhz6o7gCeuxd/EWDdPOnJCRjVXYn/B/PU+Xq4RR2PU=;
 b=AEM+No4dxJywCWkuyHkGQP7vrJdntIigIuvDIGTuG2p1pBjgjE8ZZSPOYtQk1r7PK/FI
 P7AVSaJ1/REBtxHe2p70KQTu9Vg2PLddejUgMkCUkA917Tw8a9s0DC4pXeOF4zZcXNDu
 MoYeDEUB6Z+95MleVJjLv9SiTbYX8OmAqyJATbYBDbAXCBD+aYeLHV4Ea/JrIFMh/si+
 /SswNH3rFO/lE4+hSL/WlMIPONg0xAYJ7IMC34+Ywn+DLPAitaPbyXReHyYsAzhKHwBo
 VoXOnApXKrNfRuaY6ZmArMEkyFBeJD33Y/rLCrVqO0JN1TH0wPGJXVQZ12YJ2k3G5rb+ SQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1v6ua2hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:51:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36PApNR1024678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 10:51:23 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 03:51:21 -0700
Message-ID: <dc0ae263-e5f6-b876-842a-7b598caf68fa@quicinc.com>
Date: Tue, 25 Jul 2023 18:51:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EuFKZLoFdYVrh2oTZAO98vka9-6RmJh3
X-Proofpoint-GUID: EuFKZLoFdYVrh2oTZAO98vka9-6RmJh3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_06,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 priorityscore=1501 mlxlogscore=915 lowpriorityscore=0 impostorscore=0
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_035133_392689_74AF5FFA 
X-CRM114-Status: GOOD (  15.00  )
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
[...]
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
Currently ath12k has single_pdev parameter, it impact the interface 
number of wifi.

For single_pdev=ture, ab->num_radios is set to 1 and all capbility of 
2.4 GHz/
5 GHz/6 GHz is saved into ab->pdevs[0] in 
ath12k_wmi_ext_soc_hal_reg_caps_parse().
ath12k_mac_register() will call only one time into 
__ath12k_mac_register(), and
ieee80211_register_hw() is called only one time, and only one wifi 
interface in
the result of "iw dev/ifconfig", the interface support 2.4 GHz/5 GHz/6 
GHz. Actually
there hare more than one PHY in firmware, firmware maintain the all PHY 
data and
provide a single pdev/soc interface to ath12k, then ath12k do not need 
to consider
the PHY info such as channel/BAND<->PHY mapping relationship, it is 
convenient for
ath12k to support 2.4 GHz/5 GHz/6 GHz.

For single_pdev=false, ab->num_radios is more than 1, ab->pdevs[] has 
muti valid
element, each element only support one BAND. Firmware do not provide a 
single
pdev/soc interface, so ath12k need to maintain the PHY data such as 
channel/BAND<->
PHY mapping relationship, and ath12k_mac_register() will call muti-time 
into
__ath12k_mac_register(), and ieee80211_register_hw() is called 
muti-time, and muti
wifi interface in the result of "iw dev/ifconfig", and each interface 
only support
one BAND, for example, wlan0 only support 2.4 GHz, wlan1 only support 5 
GHz, and
wlan2 only support 6 GHz.

For single_pdev=ture, ath12k also need to know some info about the PHYs 
sush as
pdev_id/phy_id/supported_bands in this patch, so ab->fw_pdev is used to 
store the
PHY data.

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
