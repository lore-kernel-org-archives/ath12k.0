Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B01CA0EE6
	for <ath12k@archiver.kernel.org>; Fri, 30 Aug 2024 07:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lD5l464YRX+FLFWsLQkw+8MR4J+C38l8uHfjruCNUU=; b=ZHlDi4B8nLgbcIMxiI6AXRrInK
	HS9g5M2UieoGsFAu1NrNpgNUzivw+l6K1nROYJpGpVNko/BB2FcE5qj4AC3xqU+28PVM7yivR9TmK
	RErpJdJ1v6m45pWk4X0Eg0qNQMCi0NqrSpflQuY6JEh1SpMDAPvb3B91rIjD7zRSLngswsR+6jTwZ
	p/qIIeA3UuI73hB4iGi8uzkYVfd2zFCasRV/YEfU77hBQYWxSoV11j0ZC27+awya1QWF3PYpb7cQX
	BMNjUQjJbIC9+1sdmAbk8fHhjo3zRlqne3XL9itr6m8+HNAX7I8DEGcAeF3UQKq+oAsN8DM3UV35E
	4XKdzg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvlx-000000053x9-297t
	for ath12k@archiver.kernel.org;
	Fri, 30 Aug 2024 07:10:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvkV-000000053aK-1VjT
	for ath12k@lists.infradead.org;
	Fri, 30 Aug 2024 07:08:48 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47THgrOK018141;
	Fri, 30 Aug 2024 07:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lD5l464YRX+FLFWsLQkw+8MR4J+C38l8uHfjruCNUU=; b=XBO24XTtBK5Zwp6/
	PPgrUKj3BXPNbeM/zBGjw4VqnTw4MjJRLKWidv6fAamH+l52R2ofVNbS+pZA9d3s
	NFRcwGUHG6ooxSTiqFgMeZ803H54w0gT0zn3sy8i4zEokiyV9jwOOYcy67MutxPn
	Jg0sfweEcmg3FQz73cI5lAvyyW4i9Trk15JKKA4oyt2iCY3KUl3gTcSW23R3ZwUX
	SduNIvVj3X8WsBJDfMTMFa1K03O1L8GSFeD33Q83Rp+9JFHRgKT+yAqqZK8YMeRA
	yT/id5PiN2TPWlS07/Oc4tuo68Vm7VOsXP8wFhvQ+w64Ft9vKGHuv6UGu9d3s7A9
	5c0WoA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putqsfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 07:08:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U78gpx024773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 07:08:42 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 00:08:41 -0700
Message-ID: <a6c609fc-150b-4779-b3f6-dddbd6ce93dc@quicinc.com>
Date: Fri, 30 Aug 2024 15:08:40 +0800
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
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <LO0P123MB4057E823BDB7B9ECCCD75840D6972@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R0dYevJrCL2oKO2rwy0exozC3Vy9ax8B
X-Proofpoint-ORIG-GUID: R0dYevJrCL2oKO2rwy0exozC3Vy9ax8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=975 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_000847_511984_A3979AC6 
X-CRM114-Status: UNSURE (   6.72  )
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



On 8/30/2024 1:55 PM, david Atkins wrote:
> Any updates on this? We still cannot register a Hamilton card with ath12k driver with a 4x4 AP

The 'Basic EHT-MCS And Nss Set' indicate the minimal requirement, not the max, see spec:

35.15 EHT BSS operation
35.15.1 Basic EHT BSS operation

An EHT STA has dot11EHTOptionImplemented equal to true.
The basic EHT-MCS and NSS set is the set of <EHT-MCS, NSS> tuples that are supported by all EHT STAs
that are members of an EHT BSS. ...

An EHT STA shall not attempt to join (MLME-JOIN.request primitive) a BSS unless it supports (i.e., is able
to both transmit and receive using) all of the <EHT-MCS, NSS> tuples in the basic EHT-MCS and NSS set.

