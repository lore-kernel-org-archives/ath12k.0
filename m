Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69781C54FCD
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 01:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJUibkuvqcc83Slk8deZNKe4ym582iCwWh1X9ZD2lpo=; b=freGQITO09/rLru0ozRErJ1FQd
	IWRrSo/kvAMm8TOSISe97ozrCTWSc8Lc1BZoYxuMqihIJpedry3OkjvR0Ia5bdNU4GL7900hreiBE
	QbgCXXpdARcEwqQV5Jwso2+mNyJRZWUW3n5YkPRIWi0Whldl9Slc14JP6hMdSywX/8MSsFNVwou9+
	0ghQ7swg3pBMicw/Un0r92pubyjgyI3WQAWUNmYXvLKWAG4OSTRuNKNypDuCG42e0B0FzraJ7YZjr
	x4Eo1nUnwSSIjyfk0VpL2YAtEgFLZ6KKuNJWfxdMM0+CK6jit6cWH9PN2pH+oopX8hUi/RqPWIE+1
	mSxeifmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFuX-00000009IDf-0BUy;
	Thu, 30 Jul 2026 01:50:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFuU-00000009IDD-0Nbk
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 01:50:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U1fSV73806097
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJUibkuvqcc83Slk8deZNKe4ym582iCwWh1X9ZD2lpo=; b=F7mZMw0rx2JKEwZB
	yH5cREwXWYDAGaWMN4JXk8LN2L4tKQPymQ/wKVn7EgLh+gy+/gt9ORfPzNcqtTHw
	Tu7GnDGz02xL+3ApYKFglYPsMFvBd9E8ucsmH64Rs74jlsYE2Vdf+PoCOIEkiAaR
	vu1BmocX940PzB/n4atFD5e1w9Q9k4+eSt75z7mwDnY7LioQA/6hhjZL5YL+hCTk
	DsX/J7EqUp0HWzWJlbSFeTqU0D0OmBUSLROBQTXgcZeNP6j3/uCJ4I1FpSq62dGB
	32nwe37TDNOD+1mQzislq434NdJ4KvzIXIsnD+TsKOA1oOh9UAUbixF1lgEX+JQp
	afhSxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqw5r80pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 01:50:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa55c9430so14202345ad.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 18:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785376208; x=1785981008; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oJUibkuvqcc83Slk8deZNKe4ym582iCwWh1X9ZD2lpo=;
        b=E+mFecGLwlzzexF+xGFa/GxqcBveSeMJqdncgfutLuh7/ZCi/MgrCO1Gu111Uo1Dp/
         N9yRh2tDFuqjLDv2OtSxV2XceUu9xk3qgm0MVPU3K44IbwWi7cr7Ef68IEesbLIoqptV
         h3dzO6a9ZvsKc5lPWE1LkUmx9GalbnK4X+bsn0t0GhLvcVtTrZGvwvo+6rsu/zNTTuJD
         KPgnojRdE5y7sNbj1nZCpKTA9S2gx3rSLZMaLY20c/TS0uPXrbHdPr/p/K+SxYsH1QQh
         iDDJynjHbye3XUfveimUb2Yix7hJR2W8Sg7/jJcAHHPYSo69GOCWQ0hC9OZ2yAGZYuZy
         oMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785376208; x=1785981008;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJUibkuvqcc83Slk8deZNKe4ym582iCwWh1X9ZD2lpo=;
        b=nfHKVfBEBCsP84dcmfYBWQoolfi0HqoHC4v5nTjyhFdCah+xD8Oe/PC4+8nEH5aGwA
         E5oYjEHZ8v8fMnYQXJeeAbxps9kaPNPUZGnpz+wDajXHgb/XiUfUfRnQKQvvIEHaemay
         nW/J+Qk89jBqOHBN4yeLJiu4UqISpZ5HVN24OEGzGR4Vjvbj+c+KeSsgeaS5YW2Ocx47
         Z93OmjZSRa4AiqPrEcpbnQgAUVCuqVjiRoFwrRjYhTmjR5lVkrZuNFxA9Y6wJfdGisda
         TLCPXQu7eR7wIbTeTyxylXDFGr6qvzu23SKPUsicczphw7wTOLbeMSg4dUGXbM14OQIn
         ZglA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4JzmLzmge37/aWPtNmACsf/1xkQYSX/FonsdM0Fr8M55vPPTZuJQsob42luI+Yazcq/g989I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQbiZAXJ10XZbmobEmh624pbvata+wMSX40xQSQ0vaHmrzc5zV
	Ik+fX2n7Z8gRNZY+7VvOA5Rtqv+8pJAgU2bfPGH7PT9Unb6fuFiO0nPD7PapmYD1kNibR3ElDf6
	UVbfQY1rm4xMDlgjNY2vMNakIRDkfnLYqY6h9M7SmTYG769d7au5xWmjqsWRtgrNYdGjl1D9b
X-Gm-Gg: AR+sD126O11kLvm3EJs7dS1uY3XePd6zUS6uPm9OOob9wiuDPUEY/6L1IJAamTnSzts
	l/vsAF3OY38lswNSAi3eEF59yW4P2bHsoWHe8t7ohvuCHkNaDj0+xqs6A4EjVWJUN6r6CVlicrA
	NeHARd7lA+pZZQqHS/TuASEQGzZiYwY1owe22Od29xjtC8v8Xy34wPjOnGAKkFfwtjj/D5ZA68W
	RAyLyIqzeFq93fdiwlzx6bct4AxhsFbu446F9vILfFxeMLwyOCJqV78Q3bvHjd6IrKUVbBriwZO
	BC/LDyTnBBOS/Lxj+ZotoEDYNdjb+iyTuXKDhs+IvYMz3bN9X6HQEJLB/B21+2nPlKbYVgF+RHv
	lSsqBRbshkfStqs07HGc80rDZB55PqRk7TwewlJS1m3DOwCTzCitiNr4U8SnH7xaL5DP7vpnqLg
	==
X-Received: by 2002:a17:903:987:b0:2ca:be8:62d with SMTP id d9443c01a7336-2d035cc4dfbmr6973855ad.32.1785376207816;
        Wed, 29 Jul 2026 18:50:07 -0700 (PDT)
X-Received: by 2002:a17:903:987:b0:2ca:be8:62d with SMTP id d9443c01a7336-2d035cc4dfbmr6973605ad.32.1785376207419;
        Wed, 29 Jul 2026 18:50:07 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf7cb7sm17974595ad.68.2026.07.29.18.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 18:50:06 -0700 (PDT)
Message-ID: <d3a636a6-ce43-4e85-9340-9353bce38031@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 09:50:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: remove skb->data check in
 ath12k_wmi_process_tpc_stats()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260728-ath12k_wmi_process_tpc_stats-skb-check-v1-1-01b7d09be20d@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260728-ath12k_wmi_process_tpc_stats-skb-check-v1-1-01b7d09be20d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxMCBTYWx0ZWRfX6sBT56MJ9CpT
 U95iCbhU45XiQOuDJUrFuOjT+Oo9MswJmL9bfvSD87pH0ElbTxJEdaCFh3tSpnsqwLyVN/uFoBE
 ghzHwTGtqeonvHwnvHxI6Dc73v2fjiA=
X-Proofpoint-ORIG-GUID: o8mwIYYHBeeJ6Xj09F11fN3kELeOa8Wa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxMCBTYWx0ZWRfX6SJRNgnc0DOR
 +0HYGtkysudui4uXn9lQJbQNmcmxQ24Gi/N0yvJ7MOFIAj4MY1HTyWP802u/iWElg28EIh+GVCb
 r5LGIVfKrTto/Ier2D8VuVsZq2Ga969u50ozksogdDfkbtnvVcvoAZFSl7GReY6tzZWSECtW10K
 HWYg7S6cja4E4GswhvAhIASp8YLLlRi8+eM9CKhXmgM/iEPf5YqoGtOMPde472w+N8NKxLm/w1b
 SuIcyuqiQ0fXza9UPiTUgfsQwbzMz94b4HsmCKqwZCnubYeTiGtiLiuKuelw330hCvPIubL1G/8
 KsVm1uNsgfwk93AXmATKV36kEc892Wc+fQ0m69Q2bgUZexeQJpDkjONDqmZ4UE75j0DF+P1EsNZ
 HAuGLmPX/1gCrP6rd9ZvwLtQXMqdAqU6wg7H44w43vCq3HUqJC1qSPh0VNgjdu8TscKNNazAyA3
 96octBIoetAylsU4xig==
X-Proofpoint-GUID: o8mwIYYHBeeJ6Xj09F11fN3kELeOa8Wa
X-Authority-Analysis: v=2.4 cv=OMMXGyaB c=1 sm=1 tr=0 ts=6a6aadd0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=R_5BTG5rON9OUESi59oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_185010_253596_2C308B6B 
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



On 7/29/2026 9:15 AM, Jeff Johnson wrote:
> Currently, ath12k_wmi_process_tpc_stats() has a !skb->data check.  This
> check is pointless since skb->data is accessed by ath12k_wmi_op_rx() in
> order to dispatch the message to this function, therefore it is always
> non-NULL.
> 
> Remove the pointless check and its associated warning message.
> 
> Compile tested only.
> 
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

