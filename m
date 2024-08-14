Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EBBC52D7F
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIjCtfI/iuhUJFiVc8tTJyCkMkp9OtYPobCTf7Rm03U=; b=qw80wkA7e64hOcuh9fhqGNemYl
	BZyVnUgj9uvOvEnHDU0NAFG7nZtsPdo5yMQmSSGjawUxyj8oE4ZlJyN2U0h/Pv4hI1NvZNT4F82oR
	wdWKDYTHwcRY9pZJTt5yK8iwbHR1lKmslD+re3vwQzdZG2rZQ0WO9zBNiLE33WwVdJN2UXBV972Tv
	YycQ1CjQXeJ6xhnlJz+izwaPo5ju5vzH9GGt6NFRkVG2JQtV4DPBA5D/tpyktdUjy9imHDbGNtqsA
	QajucLM96jfrofnTJPa8hH7ZWbu6jw9tygWPB3DLIDxlYQkv7pnjaO2l8U/CMOA0VByiJPLr90z1t
	fnfM/6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seBJV-00000006cKT-0TkB
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 10:33:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seBJS-00000006cIj-1A9Q
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 10:33:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EAJrgT031037
	for <ath12k@lists.infradead.org>; Wed, 14 Aug 2024 10:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIjCtfI/iuhUJFiVc8tTJyCkMkp9OtYPobCTf7Rm03U=; b=cDnqNKKiuAUKOi2b
	i9We49yZf3qo2X1a5dbpORlTtHI+ZX4mJIFgPXbCoOO+VdPlMydkrtFFTD2NbPuL
	SKRzfJUR1NxARdpRlJ0o1k2T8EdaZBr6o5pbKsnkuonjRB1ucBYhvxSsJvD11wCr
	nBaK8DjXMQ8/+Fl5g/AG49wxmyDmAxqljnJHiVD7+PJwZRsajs9RS9iSGRSRH3gX
	GDue5ZXe3PjelzHNBzq7zo90lFfkoTDcClOmP/nwM0hobJWj6dhZBd+8oIFa1ssp
	LxkxcTrhxtijw8T/T+5tH3KLye9FlZsLWM2938zteOLircLxKNwNO+VzROOdFpAJ
	L1o/mQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4103ws40an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Aug 2024 10:33:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EAX3PE023525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Aug 2024 10:33:03 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 03:33:02 -0700
Message-ID: <480c4cbd-cacb-412f-b23a-14177a3acc05@quicinc.com>
Date: Wed, 14 Aug 2024 18:33:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wcn7850 issues
To: <ath12k@lists.infradead.org>
References: <LO0P123MB4057D6C2F6FEFF335B30EE7CD6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <LO0P123MB4057122D4C7D07C7114F5ABED6BF2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9ZT7praQ0ofeQZbX0SadYgDe3Lc16phE
X-Proofpoint-ORIG-GUID: 9ZT7praQ0ofeQZbX0SadYgDe3Lc16phE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_08,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=399 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_033306_340320_40B249C5 
X-CRM114-Status: UNSURE (   8.02  )
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



On 8/6/2024 4:06 PM, david Atkins wrote:
> I have also seen this in dmesg during association with the AP, 
> 
> [   13.049675] wlp1s0: required MCSes not supported, disabling EHT
this is interesting ... this means EHT MCS verification in ieee80211_verify_sta_eht_mcs_support() fails.

if AP IEs contain EHT operation (I guess so) then this means AP requires NSS larger than 2 in its 'Basic EHT-MCS And NSS Set' field, because WCN7850 supports 2 RX/TX streams for all MCSes (0-7, 8-9, 10-11 and 12-13). so can you check/confirm this? you may add some logs in that function or just check air sniffer if possible.

> [   13.304272] wlp1s0: authenticate with ac:91:9b:b7:05:b0 (local address=00:03:7f:58:34:42)
> [   13.304281] wlp1s0: send auth to ac:91:9b:b7:05:b0 (try 1/3)
> [   13.312345] wlp1s0: authenticate with ac:91:9b:b7:05:b0 (local address=00:03:7f:58:34:42)
> [   13.312352] wlp1s0: send auth to ac:91:9b:b7:05:b0 (try 1/3)
> [   13.314787] wlp1s0: authenticated
> [   13.315249] wlp1s0: associate with ac:91:9b:b7:05:b0 (try 1/3)
> [   13.321883] wlp1s0: RX AssocResp from ac:91:9b:b7:05:b0 (capab=0x1111 status=0 aid=6)
> [   13.334818] wlp1s0: associated

