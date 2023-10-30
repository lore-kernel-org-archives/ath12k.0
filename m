Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4A5C4332F
	for <ath12k@archiver.kernel.org>; Mon, 30 Oct 2023 23:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0re6o0hS5JKSBaRZVZK0wxHxHWVZoTuXt+sNX1eVIYA=; b=f0dCgBtRwq6cxc
	NVYAj0R22cMhpqpIGEwhWDGvIMXEh2fM2kGa+p4LdALxisZMYKDxmit6YQYxB29Q5lwZqifek3zfA
	6HbTN+u4Uts7EDzSPKnlUaB0LNRofJwiSmA2xXOuXkFlJPH3t42dnalZs6DXzw3czis3NPq8u79E+
	JVHWRfT7xujt52/FfClraGhnOE/gXMy/zVNdZDRM6IxhaARu7WNc95wSptV5SlqJP2rmlRWTkSBKB
	54MlBQqjy0SsIYxJnfNIhBHLhVR2dPueW3W2uE3eIVM2pT7kIV/mebG8RXNybE6V63bgKrZGWlTy6
	GNCmSCepJQBjL6I9WfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxbSg-004BHK-2V
	for ath12k@archiver.kernel.org;
	Mon, 30 Oct 2023 23:14:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxbSe-004BGy-1d
	for ath12k@lists.infradead.org;
	Mon, 30 Oct 2023 23:14:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39ULVwdp030961;
	Mon, 30 Oct 2023 23:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lLNZAa0ewEEPD6FCmd1xwNhYWGPMeyvGyQg9x9ubUlY=;
 b=nEdJaKJDcGY24v9jfnhx9cx83wIV3HUh6w4qn3fTTeQiTW+/3aeGYRktTYWUW2XgBqpm
 18rdY7filLLTWqcZdL0UEWX7jH5gtP5vv6B0Xr+Kw+kcJRYy7sEH/7nNN9iCO4SKlN/C
 fPIjHtG4AAqWQ6N30GKbl8z1F/p0olRn4MV9ub3EIT42/6xZvgDz+vKVeEA60Fn4aMDW
 E5xIqQ7YrQq0YaHVLVtyxYKrPwdbxJ7ozwcae/rqAAMTTfDboFaZJvwJPT8KM6RinxHO
 f9w6nxF12GbT9YSIOFoV4TktcGeg1gtfLwcQ4ADUSAB/+Qg7SGV6LiUhsYCuU+S0+CW4 Fw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2mcyg5jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 23:14:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UNEI06025502
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 23:14:18 GMT
Received: from [10.48.245.206] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 16:14:18 -0700
Message-ID: <cb872059-fbb7-4ad3-8a6a-ebdc54618659@quicinc.com>
Date: Mon, 30 Oct 2023 16:14:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] wifi: ath12k: fetch correct pdev id from
 WMI_SERVICE_READY_EXT_EVENTID
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>
References: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
 <20231030222700.18914-4-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231030222700.18914-4-quic_rajkbhag@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UoMDCMpF6RTrbup7sX8bbZbUem7zJFQj
X-Proofpoint-ORIG-GUID: UoMDCMpF6RTrbup7sX8bbZbUem7zJFQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 mlxlogscore=587 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_161420_685384_9362DDB9 
X-CRM114-Status: GOOD (  10.60  )
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

On 10/30/2023 3:26 PM, Raj Kumar Bhagat wrote:
> From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> Currently while fetching for pdev id from WMI_SERVICE_READY_EXT_EVENTID
> we consider 32 bit pdev_id in ath12k_wmi_caps_ext_params structure. But
> Firmware sends lower 16 bit for pdev id along with higher 16 bit for
> hw_link_id. Due to this wrong pdev id is fetched. This wrong pdev id
> when used for WMI commands leads to Firmware crash.
> 
> Hence fetch the correct pdev id considering only the lower 16 bits.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
