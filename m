Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C79CA101E
	for <ath12k@archiver.kernel.org>; Mon,  2 Sep 2024 01:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTYoVT0XFh5CdsdUuCmfrxxgbv+JmIUaLtKlbI8WsaE=; b=nvgoEXOS6nocCs2dliqPGDbPQW
	9MS0/p3GeZ2WEieSWcZ9xSdP+mvUaeFvTBjUjUO04PYrJEpOQfXQUn3+zNbRKq+BtsBm3+9YZHOFs
	Rmra7yjk3HS5pkJGeEnMeT8v5AyWPfB6V/ckQSOHgFYqJSTIj4YB0w5v7f5wxw9MW/kXB5mvkHzKm
	B2CRsfzKM/Kmx6oW5qeCo+MbrGpYtF/zqF+6HvnNn9rcrbzArqaOt1uR5CPkIyIpbwNjySxRz5uBf
	jDQVE/CTJS1p58oPwitRSV1bwOiZ8qdig/rNzMo2vGgCCDKu0ShPO9FA4BgoiMMzowx5yxNsN+0SE
	eSOJQcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skwIn-0000000CiEd-2mLP
	for ath12k@archiver.kernel.org;
	Mon, 02 Sep 2024 01:56:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skwIk-0000000CiE9-3lgY
	for ath12k@lists.infradead.org;
	Mon, 02 Sep 2024 01:56:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4820cGSB019569;
	Mon, 2 Sep 2024 01:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTYoVT0XFh5CdsdUuCmfrxxgbv+JmIUaLtKlbI8WsaE=; b=YUegUsWfADEuIMeV
	GCI9N06jSbTEw8r5D4y2qWJRJdqqOJZ+jfQTykEjrUuZTk2vpcLGMpZ7KlUIFIXw
	3pGsZaMkVZw+t0bWDiInn0c5Vmqiz4LmBom2Ifp4jD65rbepKzihXq7xCn7MDhms
	6bzMbps9wyr617WmcIoWrum1F/GVPBBOleuYu8KrFODrJCqdTf+IIBvekWwju1Nh
	WwJyfn9Tg9P6MinTnMKW/O5Os2B2Gy2Z21ObRX3zskq16QTFLFCvAsymeYjQ4SDa
	dNVPkaSDKO6klf/DHDig0JjGDNtkWbkl2ell4NQVVTPZ2X1OH+PT/75Ktg6OAfDV
	Cf1bVg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bvf8u63p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 01:56:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4821uCH1016065
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Sep 2024 01:56:12 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Sep 2024
 18:56:11 -0700
Message-ID: <86bc1623-8845-43fa-9aad-a8a6066b1448@quicinc.com>
Date: Mon, 2 Sep 2024 09:56:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wcn7850 issues
To: david Atkins <david@3adesign.co.uk>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <be53813c-3edc-4734-b59d-83f43f14ea91@quicinc.com>
 <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <26bb8ec7-7170-4a09-ada3-c7c753c16e87@quicinc.com>
 <LO0P123MB40573F46A6D63145363C6B13D6812@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <cfe8e314-a28b-4ea3-85b2-9f5b4ac2db09@quicinc.com>
 <LO0P123MB405769E063E48B0F7AE18C5FD68C2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057E823BDB7B9ECCCD75840D6972@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <a6c609fc-150b-4779-b3f6-dddbd6ce93dc@quicinc.com>
 <LO0P123MB40578A6CEC43AEFE301F9ED8D6912@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <LO0P123MB40578A6CEC43AEFE301F9ED8D6912@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OOkVwjh6J5x0baN-ZfWkl81Ei5h03LSD
X-Proofpoint-ORIG-GUID: OOkVwjh6J5x0baN-ZfWkl81Ei5h03LSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-01_06,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_185619_035249_BDA10AEE 
X-CRM114-Status: GOOD (  13.98  )
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



On 9/1/2024 3:39 PM, david Atkins wrote:
>> On 8/30/2024 1:55 PM, david Atkins wrote:
>>> Any updates on this? We still cannot register a Hamilton card with
>>> ath12k driver with a 4x4 AP
>>
>> The 'Basic EHT-MCS And Nss Set' indicate the minimal requirement, not the
>> max, see spec:
>>
>> 35.15 EHT BSS operation
>> 35.15.1 Basic EHT BSS operation
>>
>> An EHT STA has dot11EHTOptionImplemented equal to true.
>> The basic EHT-MCS and NSS set is the set of <EHT-MCS, NSS> tuples that are
>> supported by all EHT STAs that are members of an EHT BSS. ...
>>
>> An EHT STA shall not attempt to join (MLME-JOIN.request primitive) a BSS
>> unless it supports (i.e., is able to both transmit and receive using) all of the
>> <EHT-MCS, NSS> tuples in the basic EHT-MCS and NSS set.
> 
> I'm unsure what's missing here, this is the beacon data relating to EHT MCS/NSS
> 
>             Supported EHT-MCS and NSS Set
>                 EHT-MCS Map (BW <= 80MHz): 0x444444
>                     .... .... .... .... .... 0100 = Rx Max Nss That Supports EHT-MCS 0-9: 4
>                     .... .... .... .... 0100 .... = Tx Max Nss That Supports EHT-MCS 0-9: 4
>                     .... .... .... 0100 .... .... = Rx Max Nss That Supports EHT-MCS 10-11: 4
>                     .... .... 0100 .... .... .... = Tx Max Nss That Supports EHT-MCS 10-11: 4
>                     .... 0100 .... .... .... .... = Rx Max Nss That Supports EHT-MCS 12-13: 4
>                     0100 .... .... .... .... .... = Tx Max Nss That Supports EHT-MCS 12-13: 4
>         Ext Tag: EHT Operation (802.11be D3.0)
>             Ext Tag length: 8 (Tag len: 9)
>             Ext Tag Number: EHT Operation (802.11be D3.0) (106)
>             EHT Operation Parameters: 0x01, EHT Operation Information Present
>                 .... ...1 = EHT Operation Information Present: True
>                 .... ..0. = Disabled Subchannel Bitmap Present: False
>                 .... .0.. = EHT Default PE Duration: False
>                 .... 0... = Group Addressed BU Indication Limit: False
>                 ..00 .... = Group Addressed BU Indication Exponent: 0
>                 00.. .... = Reserved: 0x0
>             Basic EHT-MCS And Nss Set: 0x44444444
>             Control: 0x02, Channel Width: 80 MHz EHT BSS bandwidth
>                 .... .010 = Channel Width: 80 MHz EHT BSS bandwidth (2)
>                 0000 0... = Reserved: 0x00
> 
> Are you saying the ath12k driver does not support these features? If not can you clarify the issue so I can raise with the AP team.
> 
ath12k/WCN7850 supports EHT, but with NSS only 2. Here the AP requires NSS to be no less than 4, that is why EHT connection was disabled.

> David
> 
> 
> 

