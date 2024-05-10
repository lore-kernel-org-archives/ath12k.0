Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7E2C10F1A
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 02:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSJYZAo8a2uHwJFAkM3K6IvRn4Xj+ZLTAK+2F3Osuoc=; b=ARoLnh7chRkgk+Rb/+0HRTmr5B
	mvGndDHHyKhEFL6wxsnYk+6yPx1UQwGLQZ2FufOpsuTjmK61JqTToiJvZK+hvtWqJ9CPq32pTIc+y
	9R+L1k5vpeiAVHy4/Zt6bfxdNcAcM93x/sqjtube9RSYdpbhOpZOg4jGXXg5Kq664vyr3HR1x/aHr
	60XPBS6ta8iON/6MJbykg/kzlGZ4hwhEPHaL9zG/gwwi72ZP21RcOGZ4C79tbLkxVGCyp7202Ed0Z
	ZdUISRVa0pn9haARChIKRvnKgvCpy6G8/fFiDBt/n0Fm1LFF0/TBbkNWMEl/1awnJgwFFVB1O+Tgw
	hXrYFDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Fou-00000003iuw-3tNR
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 02:17:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5For-00000003iu9-2vLD
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 02:17:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44A1B9qN009472;
	Fri, 10 May 2024 02:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gSJYZAo8a2uHwJFAkM3K6IvRn4Xj+ZLTAK+2F3Osuoc=; b=Wu
	VaE8hZIM8PtxVnXvEXUDKjHozb8UVOZ28EQgFTPc+cWHJuHsmXzBJAnYEHDz9pe4
	0sORG/1msczW7JvZ99J4C0Uc/2yOvZdBg2q9ImbuxInZhCSy5O646QXLbxf19eio
	64swzWECpk77oi0aoTO0V0ruf7BqideC4xPfqz7/6TYyE5RWW9fn+bVlUacrCZ8t
	87oVaneD+nrV3YcnnG5T76ZYq+uD4IE2gpvnyhGVeXGbRQZTJZCKl4fjGdtCGrUP
	Q3VPeWAovA6CbWjBIkLCfIm6WaskhTavVQiG0y1IhP24symIpATf+4cVF+oqCMmT
	Sb7GFl0/PfFaWkJcWBbg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w28bs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 02:17:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44A2H76R026232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 02:17:07 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 19:17:06 -0700
Message-ID: <b929f311-9897-4fe9-b604-99e29ebaf13d@quicinc.com>
Date: Thu, 9 May 2024 19:17:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] wifi: ath12k: Introduce QMI firmware ready flag
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240507045702.2858954-1-quic_hprem@quicinc.com>
 <20240507045702.2858954-5-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240507045702.2858954-5-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DmNg3X-T4nfWzfkuq6IpJDM8GGCIEBg7
X-Proofpoint-ORIG-GUID: DmNg3X-T4nfWzfkuq6IpJDM8GGCIEBg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_01,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=787
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_191709_792504_F9359D0B 
X-CRM114-Status: UNSURE (   9.71  )
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

On 5/6/2024 9:56 PM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> When hardware device group abstraction is introduced, QMI firmware
> ready event of different devices in a group can be received simultaneously.
> 
> To indicate firmware ready event is completed for a particular device in a
> group set a flag (ATH12K_FLAG_QMI_FW_READY_COMPLETE). This would be
> helpful when hardware recovery is introduced for hardware device group
> abstraction.
> 
> Add changes to set/unset ATH12K_FLAG_QMI_FW_READY_COMPLETE flag for a
> device.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


