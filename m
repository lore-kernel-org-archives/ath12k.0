Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226DCC3DA4A
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMzv/7m+RdN5ew/Dxb8uzfg7Fad0Zsp1tO81SSp8axU=; b=FRvtZUNcZXVRfb/U/2maNvGYqW
	F+WdVg1ttJnf6z8YSPtZUSskMemLm0qw/lSit2V6Q8WzQ9cJXsi76W9XxH+xnyHUdtt4jvb7USvE+
	flDeNCr3GB2R5cx4kDRLyXHVINNy/FLzw4ggVRD69W1GxODDsChc3M119epwcKSIMdh6G65SzZ7Bd
	7shPak+EB2fIjLqzOUrSZ5VXYFiTghidUPvu/VOwRRTF6/+fd7PvpTzzqT56mjFhNWKcZZMRqJCw9
	AHNU11D9AlsKEuRqVJJDuLB7bpdxwXfMUkCA442E3yDLgkeYYwXyonhf/DqJlrrNr5CHwkI+ecR/u
	onhHsiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seIcl-00000007vLh-37Vh
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 18:21:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seIcj-00000007vLO-2zVc
	for ath12k@bombadil.infradead.org;
	Wed, 14 Aug 2024 18:21:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wMzv/7m+RdN5ew/Dxb8uzfg7Fad0Zsp1tO81SSp8axU=; b=Cf6vvyu/AXSl/pjOCp6GqM/NqK
	qkwsVvmE4PDxfg0k0i9IPyO74PcZA8M1Q8BcJiecbMmDn8egptKcUDM6gB9YHkDwZ6nl5CwuX3d6F
	67ihkYYz1Oe83vfGKW+g4juOUEcQAKJrL6al/Mr6hDZwQ8HC/SeZcFCQFAGAbioc4iL0G4iqM9wPs
	BEXujwP6d5tCsWDQs4iTLPNjl1KI0GOKoHdQYCr3Q9ERHxj9FqDup0cpaOu3uyq6zP3imKHKX/nBo
	MsWK2jBt6NONH3JGhVtqxAN8UjWARvjXNfSyplPM6onUjhL2b+k36kmKjJOGkTca8CK4f+LZZpL8q
	jAqCbbwQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seIcf-00000008DoC-2ANe
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 18:21:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EBric0017044;
	Wed, 14 Aug 2024 18:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wMzv/7m+RdN5ew/Dxb8uzfg7Fad0Zsp1tO81SSp8axU=; b=CWuIs2vWHaoxRth/
	x998HT/76DBx0e4QqyFYA8CS6OBOAX3nytolmXGWo/pXqREdSoXGpO1zr3lvGVnw
	xo8hxj0wTLPMY/YFjiUwEjCm8kd7ErhbQXoNLnJCt24XVbxlCeSRcjMleR1Z4uJz
	gCTh+wxm1sHXLuLYewSJ0eYgLizYknrujmPB13SHyRUdPZ1wFHPw/x0CbYcsAhCV
	4/LojWxkQmut5A5mkutkvoEIqtmL0ltxDikilYVhqEeAoCbJPn0NWZwj0jao7uiC
	95usJQ/WvB5RI1YfCH8iDJIJc8AGbygTOtErNl6IHkCdCqCp63hBSQi+2TCvdBW/
	ejnZLQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410kywjd1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 18:21:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EILIpe019619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 18:21:19 GMT
Received: from [10.111.178.117] (10.49.16.6) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 11:21:18 -0700
Message-ID: <0efa8cc7-43b9-4081-85ea-007e8e83f960@quicinc.com>
Date: Wed, 14 Aug 2024 11:21:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: Refactor radio freq low and high
 information
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240814103423.3980958-1-quic_periyasa@quicinc.com>
 <20240814103423.3980958-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240814103423.3980958-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aATvlnsjK110Lil4XitBJQZJ2er0-ov6
X-Proofpoint-GUID: aATvlnsjK110Lil4XitBJQZJ2er0-ov6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_14,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_192126_300619_E807A0F1 
X-CRM114-Status: UNSURE (   6.82  )
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

On 8/14/2024 3:34 AM, Karthikeyan Periyasamy wrote:
> Currently, radio stores the low frequency and high frequency information
> as a separate variables. However, cfg80211 already provides a suitable

nit: s/as a/as/

> data structure struct wiphy_radio_freq_range, to store this information
> efficiently. Additionally, for multi radio per wiphy infrastructure, this
> frequency range information is essential. Therefore, to enhance
> adaptibility and leverage existing structures, modify the storage of

nit: s/adaptibility /adaptability /

> frequency low and high information to the struct wiphy_radio_freq_range
> data structure.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00183-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

(Kalle can make the nit changes in the pending branch)
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


