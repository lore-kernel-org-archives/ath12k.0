Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A4FC87FCF
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 17:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLC8GBJ52JS4DT8cnivnM/XJofTs0u4QYcTbqVdpwM0=; b=izB4RwvuLa8BJuLTud0Wc0UkBx
	MAHXHAV1C9Jk7UZGySBAbS2sSqcjU6ngC9HPHbG5L6RLNXKt744HBOdKSdyMnLAHZHuVvd3spmxKb
	edQzRLhZMDbskkquY/zBDLGJi9kRBiyy6zqjM4CcoJBba1CnX81FsO9Vw5UstWoyEkIijLQgk7q8R
	c4ABiKj7tUpi3rv8zqqBe56wsa0dLgf9JNWcXY0fL+rC/VlFxjjELPgh6lWUpxvgR6j499qbhN1X5
	Jja5Wd4Qk+FI28X+U/aE3w55PnDIr54Xj9GSjLExRchsj1FsHQoz0CkYMMUS+nskhWyjwQpdfIp39
	PtVblFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4GG-00000001EMh-3EGs;
	Thu, 07 Aug 2025 17:18:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk4GE-00000001EMJ-1Ulu
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 17:18:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779CumR007839
	for <ath12k@lists.infradead.org>; Thu, 7 Aug 2025 17:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLC8GBJ52JS4DT8cnivnM/XJofTs0u4QYcTbqVdpwM0=; b=bz6yMIvrF9kz4XD5
	JXh1ZKRAyPHsw7ms/x/AUct7v/ZICwoDIGWBEoXLH+y3rHmxk0r2ynysiQgGvbK5
	M1NeeLuLYhvy6mhM3394k5ccr3MZ6tgu54fwlz1o+LVJbRoRdvMbRq4zz2hqrQXc
	Klmc41t1EACwREobXBIWgMsIqpIb2TI4id8u3aWiwszLy8ISiEzfp3e2gSL2xCN1
	SlryyDV+M26I+zlwStMSAxdGM4AG8wsFy8c9HS18M+Z4ZGYqD/xyoMy0z0TQ+j7o
	mhIRzysGp+bw0kpmFtT5fTjzrl5jsOVQvzLOOdXJIzeEYIkATxpAVsyK9rYrtHr2
	ij5G1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6y3fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 17:18:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31ecb3a3d0aso1200815a91.3
        for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 10:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754587116; x=1755191916;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLC8GBJ52JS4DT8cnivnM/XJofTs0u4QYcTbqVdpwM0=;
        b=DoA+x/tTPwzxpnIzP0dEzSGcvwISJ9JG568DA14LO/gCbTgEt/DJ3fwhG+7eG7tOIT
         5Mn44XBHJtBtHoiRhcDBM3LRJmwk7qgBBhv/VFeB4aLAg1JSBGPd2oHcAkf3KSuKDMDC
         I7UBYHhSjZsdEUDx9NN4Yo6LvEjxAdw507rV0D7gmfD60u82k5L7NHOjy3jaly01x66w
         j12SRorHjB5MzzvOnNRedytxrZQTPXiWdxomv4Q3PNKWGNpqh4zRhElMr/KiIWF1H5Ur
         25jf7nvuyYqMizstrrl0Qw/VJr2cuGLHV10y4RQvxvjSszl2cNR8XKYoCPwD2gyJRQri
         vUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4wD0K+jQRdQJwqslWOl4o6q7Pu7kA54sis8z7CrPDpBT/UMcArJlJzCegLZ/rYTaEz8WFER4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4p6LFGfwLi4FlCabXiEMXE136YlxLiOdHiqJF+Mnvfl6Vq4N0
	RoBCwKKJeLUAl1CmCkSqYDS/aSFv14IFr2xg1G3kk+dSp9pkbj1Ybk/6Iejh4nNBM2n9cB4Dypm
	uPGkPTxPRvGglWN3iyB0gPzFHYRLKpvaU4J2Kbf7XxsoxA7gHNP82/+0/fwxR+NEy
X-Gm-Gg: ASbGncu1k8pZWYS1qpWoRL6bmpylL71410ACjQ1ax5npkiVZF7WnIFaTFmslimr4utW
	uQuDLtusz4HF7Ua0HOPE9jZddx3gcH+6op2xNC6YB+BiLponjHgNAIYSV9JAF+mBFUrZiPxIgCg
	8QNoYeDrg7crBeYsRdvK5JkRhbhNcPFxqTz84qbv6xxhzSBvE4lNALMKUA26vzliwiv2MTj1Wlm
	vGrx9o9BUwm/wpJ8CUn6enpznADIvYrsB9gQtSU8hPkjPRJrZpsThIYAo/3BKFH9+sjQYeWr0I/
	rdAZ9Dt/8uBOiPZMVjcH0gt6VtOVAkelvQtLm0AkVkLtW8g9ksIkuccYirBEDgKlZ2y3YsdN3ku
	F6CfSbhlIUANzum/kkNo=
X-Received: by 2002:a17:90b:3806:b0:311:d05c:936 with SMTP id 98e67ed59e1d1-32166ca78dbmr12228081a91.17.1754587116447;
        Thu, 07 Aug 2025 10:18:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDSBIxZMtyLHjJ8ZZPSYmQQchctU93wo3YtjIAb6ci0mllkfGZXT4TLleL1LzuppQ6KSZiwg==
X-Received: by 2002:a17:90b:3806:b0:311:d05c:936 with SMTP id 98e67ed59e1d1-32166ca78dbmr12228044a91.17.1754587116004;
        Thu, 07 Aug 2025 10:18:36 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216129c8cfsm6088656a91.34.2025.08.07.10.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 10:18:35 -0700 (PDT)
Message-ID: <9b1f4ea5-2948-4807-a4d2-0efe7b672a4d@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 10:18:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
 <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yPZQ5WMUYe2vhl6AzDxwfH6XLEOWlU1P
X-Proofpoint-GUID: yPZQ5WMUYe2vhl6AzDxwfH6XLEOWlU1P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX8rw1tm8Kh/yC
 qv0s7C2ORA2xgPgtyack+NgKl7+DQ8ncgg3V9B2UGmVWPVB4iZ7tyRTfacX15y/mn6KWUq9Syan
 nO2+V5YTVh/N/ITdUAgjp6GdUoIJQ7RCnOdX9qxFf1bpCTtjV9GoxtbN23UAbFN0Z0HH7yJYRNH
 an/Sz3oUfAgPQP55vvaPmer3gvHOhULguKJNBrhxl8MuX5l7X/YpYLWZZ3H6dC8ZSj8tuBdabFY
 OaA64OZBbzkHdC5IHLulzhi6LSCPRzz1gyqE8JrW+SHGHigUXMOgOE4b0VO0LDHqcdcy6t01Jr6
 RuazILooQMKmja00fg+1A5mzhPgzbB6Nl6qf0M6HTMf3UxqDL3Rz8CAIQr8sqthGxielEvDhQK/
 rtStmfME
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6894dfed cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NyTICe1PHtTOfF-B13wA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_101838_405915_E509631E 
X-CRM114-Status: UNSURE (   8.26  )
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

On 8/7/2025 12:43 AM, Mukesh Ojha wrote:
> fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
> used in the past for logging it but due to code refactor this parameter
> is unused now.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Reviewed-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


