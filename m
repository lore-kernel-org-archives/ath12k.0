Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570BBC3DA4A
	for <ath12k@archiver.kernel.org>; Thu, 15 Aug 2024 02:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5u+FTEz/+u/P8jahSD1XdQUUnlL24JTfs8dagwx2SA=; b=vhIWHqidsn5L5XE/lxjO+GcQKZ
	9/8oBwGai4YL/r3z+mR23eNlSQhof90/JyF3Qnay/oM6TMiCMZFP+nz2qRGEXzJCGoGQCslnF5zzu
	t4uiBVKlrUiJefHj69gzitEG9AEyYWq899PYHIbXwT3dS3z1EgQkGtVys/VZU7nC0ibrp+iJfmfCN
	1WcJgrmFP3sTqDRtrWs3asR0Ed/xpErqpbOgjIc0uw4D3M5XRjzn1a3P9lR/Ygiyv7vAB/bawPKBZ
	5zS0hMbAqlZ6og4v35KM0GENaFenAcOdkkaiAgNPxCcFMaF7f61cZHO6m/OYE4nCpGoOFn7gm4KSd
	P8Vf0I4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seQ25-00000008oq4-3jmL
	for ath12k@archiver.kernel.org;
	Thu, 15 Aug 2024 02:16:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seQ1z-00000008opO-2DgL
	for ath12k@lists.infradead.org;
	Thu, 15 Aug 2024 02:16:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EM6qkM027646;
	Thu, 15 Aug 2024 02:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S5u+FTEz/+u/P8jahSD1XdQUUnlL24JTfs8dagwx2SA=; b=KhDmMztzCjufPNCr
	WGxfTo29T1MJR2GyIIH6DkWrzVlA/FPcdrpbtr5GbPBmgKse0ZNdWqkg1IpPYLs3
	dxUV52KvGeTO4Quf7dc4DVzsUScB4upNJeW8I8lx7/6Iu9gKK3vgKPnPRyPKhgbY
	0nEeX+6TK8PL8Wejeu1VeUJ8YtxF0GPFhZkC9RUnnJJn/CdO8S2borWcm+UwuWlr
	uD+HbgONr5vPz1tAWD4ZrUEk8CTQ5ODNCTAxlrt16sopoKfbKFzZdSQOwhoazz3t
	7iJhhE/U9D5M4Dr/M4Je/6Zj6eQSiNvk4vyRO7/+fLa6qFjoruKwdsemXOo+WMVx
	Uqa1Sw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x3etcyad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 02:15:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47F2Fw66012116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Aug 2024 02:15:58 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 19:15:56 -0700
Message-ID: <26bb8ec7-7170-4a09-ada3-c7c753c16e87@quicinc.com>
Date: Thu, 15 Aug 2024 10:15:54 +0800
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
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <LO0P123MB4057C3085F445434F5E87B3AD6872@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2OiDoGWWI-IBKQAW96qg6qkvc1tjazEa
X-Proofpoint-ORIG-GUID: 2OiDoGWWI-IBKQAW96qg6qkvc1tjazEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_22,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxlogscore=775
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408150015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_191603_739941_1E4385E0 
X-CRM114-Status: GOOD (  10.96  )
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



On 8/15/2024 4:38 AM, david Atkins wrote:
>>
>> On 8/6/2024 4:06 PM, david Atkins wrote:
>>> No support for EHT and therefore no MSC 12 or 13 which fits with the
>>> dmesg warning about it not being supported,
>> did not noted this ... So if AP does not support EHT, above warnings makes
>> sense, like you said.
>>
> 
> Anseres inline, AP supports EHT
> 
>> is this a card firmware
>>> issue rather than the driver?
>> did not follow you here, why is it an issue?
>>
> 
> Is the firmware that’s uploaded to the card not supporting EHT?
> 
FW does support EHT.

You are checking scan results, so it is AP not advertising EHT support (actually AP supports EHT, it is missing in scan results because IW does not print it. I don't know your IW, but at least upstream IW does not print it currently), not WCN7850.
> David
> 

