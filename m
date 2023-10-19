Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE66ECDB483
	for <ath12k@archiver.kernel.org>; Thu, 19 Oct 2023 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7l1/T8bLvlsDfSRQhPKzOWaYQoG/iOu/k+f59xQlTA=; b=VH85ydgAmhSpPT
	PmKMRmZJzbC6uC3rpgPcR6jmpqJs9kcrfqnLTLQ2bOiDILp3aQGLeLlLP+Otun3vsRz35kI0bxxd0
	f5lCTBOfHVyIZJ/w4eyRnfBbxdCMfH80E5Ky/uRGT+bjKK1We6XWCMtHDZ46LXnRZ/n/VWtXN/1+Y
	CFfA1PWhZUr66CmPs0InXYIVX5LHUIlA/36NO0vZuYAFCWvLe1Bn19XKYq1rjnZWLf2Ijohj5HXbI
	fFg3zK+JKSHqwn8e44JsPpdXWJODjDOR6J846xlNKZFUFXDNWbg8k9p9IzljktyQ+E3HmekEEC/g0
	uEyI5k6O4GbDis51pRYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWtj-000QjU-2F
	for ath12k@archiver.kernel.org;
	Thu, 19 Oct 2023 17:33:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWtg-000Qgk-1m
	for ath12k@lists.infradead.org;
	Thu, 19 Oct 2023 17:33:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JHMWw4015395;
	Thu, 19 Oct 2023 17:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hSDxNbot7+m/+CmxWZ/YuRhATf9AFer7UvRxZ/UJhh8=;
 b=Rx+tFQ4McqlKFSPTQvXuQc6/JfkltsqvEiyLjipSjlfcVA0+85MYhrhZytYSo9V7YjFV
 DEf/PduFO+nm0415OsV35r4bmdiucA9/gl8cP/bOz246qLzzmkp88T5l1UdCPtdV3bjs
 mV9vokh+g0x7G/lakE5hF64LvAQQHBhYw7cgBVIC4PCn5N4ry2dl6MHwhf8OANTSIjaE
 sagigS0GxgiZh0B9nZKp/YG5DLdVWhnh7YLLNjmaX2/Mqif7A9iXCAy6cIoptLYWzdZk
 ZXN88CUXRk4rRTjALKcRk+AWTnNMtwM9im7TnEFE04tljxK0GfdUVAu95l/x8drtO3P3 ug== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tu14cs6pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 17:33:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JHXHLK010429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 17:33:17 GMT
Received: from [10.48.241.70] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 10:33:16 -0700
Message-ID: <69b0b9c8-d06f-46b5-8246-a2e1dce0d06f@quicinc.com>
Date: Thu, 19 Oct 2023 10:33:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: fix htt mlo-offset event locking
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20231019113650.9060-1-johan+linaro@kernel.org>
 <20231019113650.9060-3-johan+linaro@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231019113650.9060-3-johan+linaro@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O8n16vmkdMIhsOECwXV-9vjXnY9_BkmW
X-Proofpoint-ORIG-GUID: O8n16vmkdMIhsOECwXV-9vjXnY9_BkmW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_15,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=456 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_103324_702248_390D6775 
X-CRM114-Status: GOOD (  10.43  )
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

On 10/19/2023 4:36 AM, Johan Hovold wrote:
> The ath12k active pdevs are protected by RCU but the htt mlo-offset
> event handling code calling ath12k_mac_get_ar_by_pdev_id() was not
> marked as a read-side critical section.
> 
> Mark the code in question as an RCU read-side critical section to avoid
> any potential use-after-free issues.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Cc: stable@vger.kernel.org      # v6.2
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
