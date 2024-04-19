Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E85C4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BazMf+2/JmjsYTkqSzbPsMJcHIkKqVSEwsvdxK82s+U=; b=I6y8ruphLfyasOSRwQWYZ2ySV4
	+qU4g6uKTW1tpQDSWFye64s4CRAft28DXW4JJQRMKR7KRgF04cJzYCDlPoQ+//uUaiaI/FIXRlQTp
	/InSiGgzma6LS3lx4yDIBB3Bv0A6BZiKLgvvbY3yrauhHbbaJW3O8QUN8LFHi+PWqBcOqFWYbmIQZ
	BxTc84TGn7t9+IlGiGsEpgLb5IRCs2JUgevXwUSgcHJo/i5GjmXF6sI6blUpq95y7H+7v/oKzlbMi
	0eWCAIJlFwXdap4HtDzrXMtVHMeJ/PfbNNeVozauT6b0P/m4jpSulIp7ZVnZXjcFUil1m37l6P3gI
	aRfUbwfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpak-000000062UV-1642
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 14:51:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpac-000000062QY-0Jkg
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 14:51:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43JCFOfN004540;
	Fri, 19 Apr 2024 14:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=BazMf+2/JmjsYTkqSzbPsMJcHIkKqVSEwsvdxK82s+U=; b=mk
	5W5+bsjfEtRfJvtWgJRRnKmioIXrH6oynQ8nfUnk+JnUziX86hmbb/ksmtOaiMLM
	XI2xykWl8tVbjYbN1RXTZDWGO1hgdzW8p41sle2/c7boBVKGZ6ZZuY9/fuwUp3fV
	9paFR+zM9S5knVuVphgVMHR5XyXCjui7pYBfbdDJFIulPMqCxcqvsB4AA+tgrud4
	VcKdBa8FyBF+t5Q0oIyXIGG/9guWTPVqYCgIkpPxx5oAIVz91ItAuGwtIMAWw8mD
	KHuljhIBGMHAalCLkhiH50BPYyrch+mkF/hBtrZMTPNdyxJvfzZvDCAnIFKCRk6+
	0OE8B3CFVdcpkSfGVOSQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xkgrmh860-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:51:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43JEpd41016097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:51:39 GMT
Received: from [10.110.56.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 07:51:39 -0700
Message-ID: <a24666f5-503e-46fa-9232-df4748f824bf@quicinc.com>
Date: Fri, 19 Apr 2024 07:51:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] wifi: ath12k: ACPI support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240418162019.1246749-1-kvalo@kernel.org>
 <71414c51-26b2-4ce7-898c-5df0e8e31825@quicinc.com>
 <87h6fyhtrs.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87h6fyhtrs.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8xlBxQNLy5FWszig2-Rmi-uRJ_L6uQch
X-Proofpoint-ORIG-GUID: 8xlBxQNLy5FWszig2-Rmi-uRJ_L6uQch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_10,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=583
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_075146_349072_1E990288 
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

On 4/18/2024 9:16 PM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> I can verify this doesn't crash my system, but apparently my ACPI doesn't have
>> the underlying settings, so cannot verify actual functionality
> 
> Thanks for testing. I hope Lingbo has a device with proper ACPI settings.
> 
>> Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: acpi_evaluate_dsm() failed
>> Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: failed to get ACPI DSM data: -2
>> Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: acpi failed: -2
> 
> I just want to verify that these are debug messages, right? Normal users
> shouldn't see any ACPI errors if there are no ACPI settings in the system.

Yes, those were debug messages (I've added ath12k.debug_mask=0xffffeffa to my
boot command)

Also note my Qualcomm Innovation Center copyright checker reports that the two
new files are missing 2024 copyright, so please update

/jeff


