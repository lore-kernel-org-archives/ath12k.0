Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B41C54E58
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=synPQhheQ7nttk4p7RxsmUA/ZDUQQxQq5beeblx3oTU=; b=ahh3ldTT9j+8sqp7pbtNfi79Wk
	W0IqEsQubKlsWSvzPQO246AqXulJY1bwDhALgtDbXQbjOKzL0P56H9D3NBYL/wl0TJaJt4ADvR7Bu
	RXq0JqQtV1SJ+l2fDmyiDot6VWBc7KlUSOXvC1poZFJg9Ss4pRTO6CGkheEVYhLeLNg1GJOgNm563
	Z1gSoFb21XAtAfPVQaC4d01Gb2FaDBpgHfcqKXA+Bp9iyZ+WGqhRdgGi2n9PY0/iAs5J96nu2JZTo
	Z3l9Zat5pYpOQHeya/ar1AeGZFZ/NG00MevvBR2LCx3PK8HypKSzlLJoCcYlSgADOINvWhGVMcyEs
	nVg5Ybzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyLw-000000056I6-3DCl
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 09:23:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyLf-000000056E3-1OR4
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 09:23:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C7XMNs023593;
	Tue, 12 Mar 2024 09:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=synPQhheQ7nttk4p7RxsmUA/ZDUQQxQq5beeblx3oTU=; b=Hh
	8BbXaYX9rlWOFgBQL4wGCpg3U2rdpGRUULaAsujVuHHJ0Qkk08aJp8cjC2+q1G3v
	zKHyJOtYTczMf7lom/RiCtH4B722l7ubxlPlWXFllTXSX04WslAS8xJ/FaFxfOIr
	Vd2pnuQVtTXMYq3LCfJVYVeNK9eW4g6nTZgLRZdNnNeuSwo6Br2LnXvCX+ODTXJe
	n4mKog+h5RpfDU9jDBXUxpcqlBLPUErf8ik/4Etcv5JPOzhc56h2WPXPrKUwOSF7
	82GvsXngsJRVDQBxhOwq7/VjXNOEdyZ9b3Noap7TKbBiLxpV1f1VRQfk/c5ppxJ/
	CxrkiEcen/ETZi+N28gw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wt75e9h33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 09:23:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42C9N1PH021151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 09:23:01 GMT
Received: from [10.253.9.188] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Mar
 2024 02:22:59 -0700
Message-ID: <4c1adfca-96aa-4b41-86b0-2fe5ad3e6cfb@quicinc.com>
Date: Tue, 12 Mar 2024 17:22:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: mac80211: supplement parsing of puncturing
 bitmap
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240312045947.576231-1-quic_kangyang@quicinc.com>
 <20240312045947.576231-2-quic_kangyang@quicinc.com>
 <8cc7e7f7b2914385b481ecfdd7bc3f67fc4546b3.camel@sipsolutions.net>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <8cc7e7f7b2914385b481ecfdd7bc3f67fc4546b3.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M-UDRIE9omzwNjmEBQ68hSYJk6VkVDcD
X-Proofpoint-ORIG-GUID: M-UDRIE9omzwNjmEBQ68hSYJk6VkVDcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_022303_548620_E34303EA 
X-CRM114-Status: UNSURE (   9.78  )
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



On 3/12/2024 4:16 PM, Johannes Berg wrote:
> On Tue, 2024-03-12 at 12:59 +0800, Kang Yang wrote:
>> Current mac80211 won't parsing puncturing bitmap when process EHT
>> Operation element in 6 GHz band or Bandwidth Indication element. This
>> leads to puncturing bitmap cannot be updated in related situations, such
>> as connecting to an EHT AP in 6 GHz band.
>>
>> So supplement parsing of puncturing bitmap for these elements.
> 
> Hah, yes, I just noticed that too and fixed the second part yesterday,
> and was still thinking about how I could test the first part :-)
> 

Should we add validation for puncturing bitmap in 
validate_chandef_by_6ghz_he_eht_oper()?



> johannes
> 
> 

