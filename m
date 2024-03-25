Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC76C54E58
	for <ath12k@archiver.kernel.org>; Mon, 25 Mar 2024 22:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpBSl8O78+PSY2dE+UGYMS+T0HSDA5iKZGlC/AUwaRI=; b=L+05Y+q/y5ZYjrXXYHi4gFCYPR
	WBU30pqrtgnTyrY1inwclRKJ/i6TC1cAaJ10FN6YjGrW6+UTqQBDXsgIHX119lUVE5rA5ndJAxCG7
	dXyeSeSChy+obgtz/Fdtz5wfrb0qSGNZUN2Pneqjg0Z5mX9j8BvErLAVkyME2en6lqOIm12UxjOux
	TUm3Pp37uFN/rS8cYnolD7GZ6R06YYxkYRyTUKYVrSMGnIGoPgLw4sq/Y/V9bv8rqiVUAZPaPJuc7
	c0XBXNmik6KX/n79hPl7XP/lTUebz7beK81qhmvaheYfsfXaDdeZXaCCQDQtzwVxAPYWZXkYvM7kE
	N1VlnoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rosXA-000000029aH-0yWm
	for ath12k@archiver.kernel.org;
	Mon, 25 Mar 2024 22:11:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rosX5-000000029Yh-2rFs
	for ath12k@lists.infradead.org;
	Mon, 25 Mar 2024 22:11:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42PLf8TN029785;
	Mon, 25 Mar 2024 22:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=YpBSl8O78+PSY2dE+UGYMS+T0HSDA5iKZGlC/AUwaRI=; b=lf
	weCnAhcGe/MHUr6rD1w/WfWZsZ2pq0Fei1eKXva+feeygqq2rw6N436Io6BORGoA
	n+eqqZ6RymT++MY4XQfJ1RFHDMMzZv1qB9ZgsB16xcZbQQJTdSsU5ZV/3m7Zpne6
	OCma6NSIefre+uBet7NcrmRFr3JMoUS4tMWQkqbH0Fd5LSmm5f7qgc19qPEj/Qfc
	KiXeWS1zQpGykeFj/T1ZlscC85pa8R8Cgn8/+r2/4gLS7DNF0mF2Mo2zj7QosoYj
	amtOLDO/shG5mdjnYX6QQKgFJKoPK8NELXK48BH11Kfi0x02b7qirdVdwb7uYxkf
	1io3/NTuD/lt8Kl1b7kw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x392ms7ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 22:11:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PMB48t026557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 22:11:04 GMT
Received: from [10.110.28.48] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 25 Mar
 2024 15:11:04 -0700
Message-ID: <35309bb8-f400-4b26-a217-cdecd4b43bd5@quicinc.com>
Date: Mon, 25 Mar 2024 15:10:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in
 ieee80211_bss_conf
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240325201031.10837-1-quic_pradeepc@quicinc.com>
 <20240325201031.10837-2-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240325201031.10837-2-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: fj_Fulrz6c9wfFVa0Hd-ltqVaVzY7-g0
X-Proofpoint-GUID: fj_Fulrz6c9wfFVa0Hd-ltqVaVzY7-g0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_22,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 mlxlogscore=824 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_151107_998365_224E9F5B 
X-CRM114-Status: UNSURE (   6.92  )
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

On 3/25/2024 1:10 PM, Pradeep Kumar Chitrapu wrote:
> Add flag for Full Bandwidth UL MU-MIMO for EHT. This is utilized
> to pass EHT MU-MIMO configurations from user space to driver in
> AP mode.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


