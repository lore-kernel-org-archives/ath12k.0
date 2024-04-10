Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EEDCD128A
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZ5Xd+5UAr5QCT79N09AiNz7T8/on2P/RvirmiBIQio=; b=BA3GNjucRbe9jH0KhDnZnxAPlF
	3/NJblAULXv1FnrTnCpC+tT1awldWntogVed1KKuqlx6ilw5ftSLi6ZDGuRXI8T2k/RWRVu/7qO0y
	SmKp9gowE9p8eYveqVhqibXN1pfNj7D68aJKBzQkLNQHTUpkeZ3khjJOGMIIBR9zYBLxQQM1uwKt7
	ru52eIlFlY5ocinl0Ad4jzQQfUJIn+mYN/5dFL8mgrhAac7yLaUtS4lTKMgrrinC8iXf/IPj/tXba
	FepxBiiAyOjRrOWS1JfdfLNC5n+XiKHwV00fBZ1Yssxty/WepjG0qF7oANJBwhvTYYqtOKt9wPlcY
	cV/p2I2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubBR-000000086CP-3H25
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 16:52:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rubBL-000000086Ba-3SP8
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 16:52:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43ACJVCl015865;
	Wed, 10 Apr 2024 16:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=PZ5Xd+5UAr5QCT79N09AiNz7T8/on2P/RvirmiBIQio=; b=Pa
	efrWIfS+h+r+4XOBuFAiI5GuZhEuszSzCf490t7rPk6fA8sxaKNTK78NZ4EJuJed
	5xVPTGTSQ6GHsWl46XYqWYFGD4D9/l2hqRTlFItdSnOXc1pkEn6lKXs8mz7wylh4
	A+wsOSpBRyfqPkZgE7sVrNWvFqbIRRDQ6ym/ReTAiKc9oFLZEm7Igo6UUcd7sZzn
	H1VzRzrjUoSGTdJlZcSSuTTOfFB/rgVnTQ5Pm32HseF8vgnNkYAS+pa1zGRAmc4q
	zj7cqk4KgeoyIwp/1293M6acXLla5hiUJF80Lqyp4H0K3rPBDTiRUz8Mu4nkKrTZ
	pC1/DlCa6VMQnnor8S6A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdrkp9t9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 16:52:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AGqGuP018813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 16:52:16 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 09:52:15 -0700
Message-ID: <3c9ea861-3964-4ae3-9c49-06760ef15406@quicinc.com>
Date: Wed, 10 Apr 2024 09:52:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
        Jakub Kicinski
	<kuba@kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
 <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
 <b455f267-9552-be3b-95b0-a036bfa8e14a@quicinc.com>
 <902dd36fa5ab0503377e558b92505fe499f666fa.camel@sipsolutions.net>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <902dd36fa5ab0503377e558b92505fe499f666fa.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e_vJnnS5KvkjJl3oh0dXumNhbB-g4bzS
X-Proofpoint-ORIG-GUID: e_vJnnS5KvkjJl3oh0dXumNhbB-g4bzS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=853 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404100123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_095222_121903_9F85CC60 
X-CRM114-Status: UNSURE (   6.88  )
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

On 4/10/2024 12:59 AM, Johannes Berg wrote:
> I found the code that needs it later, just that Karthikeyan was using
> the wrong explanation for it ... I'd hoped he'd understand your own code
> better ;-)

Internally I'm stressing the need to provide sufficient information in these
patches so that you (and I!) can understand the entire scope. Please continue
to let us know when we are failing.

(bcc to our internal development list)

/jeff

