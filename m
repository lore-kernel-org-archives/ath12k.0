Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D999EC4451C
	for <ath12k@archiver.kernel.org>; Tue, 21 Jul 2026 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYflFeJGiDlHHnobo387r0vJX1+Zy6ipWPbVmTEI7xs=; b=JMSDvpmhzRBkdzWQ73qlMBe/Rw
	PZTkyqTZfEXcgBYPX+em7XLr1H/Yt2flE/ZpN6g5X3eoGvHo26Bvzx09dsw366yOXJHlkeiRx7v6A
	qb8ElRT5fD/KHI1Ank2OO7FndjWNXbh7DGLacpu4OcDpBFV60dGoghCjDM2viILSXEiGHg0GUJkBF
	E3SkLFBlJunnIUcpuhDes3muIt0ntk2o9+A3KThhOsv0rkoh6Yyz38DQXh7CN8PqyyOsY+tMje44s
	6jsLiRRIHcIT0rDsRMCDi2SdVNyFcJE97Ro9ZvMM25yabSahGdcy6YI999bSLWtBoaC46H0QG5TA1
	MGJ4Z/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmD4O-00000009rPa-2NAW;
	Tue, 21 Jul 2026 16:11:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmD4L-00000009rOs-3n97
	for ath12k@lists.infradead.org;
	Tue, 21 Jul 2026 16:11:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfpIM2962565
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 16:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYflFeJGiDlHHnobo387r0vJX1+Zy6ipWPbVmTEI7xs=; b=LEk/9VJeNAlW0YbT
	5OLIhpcDjPQP01Eoab907ZsoC1wOzRqWursRoG9O5RKt5YcNEH2CRiFrmvIRH6L2
	S+KUtsMHdmklfsnaHaihhIcFnBzCOHrjuqK8nG3+C+01OA5tuBi0Ksb6hNuo5XMe
	Ia6cm8Rg5TUiHlu4HLXwqojHz0XETOEYJ6RmJMHa6e7iSXsi9Z9dJBQsOwx/VWb9
	q1r1JZpmczPmCn6DmJo+FsAQTIKtg8Y8AasB7f3Tpa5i5KLP6Wh7xlJq/GvxLTBC
	zaimcB0T8ClTbka9oXJrv2bzzUFWORNgVlatCcZnAMN5m7cMqnDRtE9gfimnt0QZ
	1AzJcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsss9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 16:11:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so7539975a12.1
        for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784650305; x=1785255105; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYflFeJGiDlHHnobo387r0vJX1+Zy6ipWPbVmTEI7xs=;
        b=WUlcJtJyRWb2aTAjbXNtCHmgRh8nU2POzM664EU193mOVxqxnlv8Vwt5DPKjXsdyHf
         Sl5pOcLqb9biR1oBR74Ep6zUm+3bTWip6PLLuCU9O4HW2DyiuptxztGImCiYABjNQ61O
         a3PCLG1VRzg6km7VxRmvHuokFrY+9sSst3TzjRqNMANmjLcZY4jAP2M4ldxmKO6cV+mQ
         nDidDW3HwFulW1Y4GhDQqRI/sWzfhRK0QBxvOzUrSsxZ5y6e/dBTl5WkorwTpg4uXIqg
         J51WHiEQW4linrlcdo2TotHis3jzFjn/cofH1lbjWJsdNHR+QGGq8yRyrGGATs2rbolD
         /JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650305; x=1785255105;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYflFeJGiDlHHnobo387r0vJX1+Zy6ipWPbVmTEI7xs=;
        b=Wm+dQperalPFeuV5N2hMatiPsNIwvW3hJaEiROdMP/TYKxoE4xHcJK+DUpEIXeZTEX
         QskNI52tKrMmWijHTNDoWGkhgjPnI+qk1D0XEnZO9wpb7HozFzYZOtCOWoJ6mgEfLbGo
         ElDDKdHzQs7A6lBIhwegxpmpCicpZldoZvPhs5pFHrRvn0bnO1Pz+roz7l5mobpUrENu
         fDORPL9kRwU7WQHWlI8I9PldakkgzD6GSZgIpToZ7cvNU4CmRS9grW6U5KUjxwG1dEo3
         /+JhPwmsiIccTflwQ8uKgjZRGP6178wO8TO388wYXHQuH/soi/r2lIKe8jSXLrGoiC2F
         ljew==
X-Forwarded-Encrypted: i=1; AHgh+RovWUdARrwsO89SvGJ/oX4R2MsQPSY9J16MfucXSqpHymsGUsmM1tzxyZl10ZW/YHMegh2IP1A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiaIqQK6E+LztscSYEd0ZvQcruB15xtEDx4NJV60QDAMUyQR0Y
	Kqd+2AHfbyeutNZVyDh+9tURmqvGe0t2X+K9QIZjkAdHsF+432/8AB0UzWHyRybCMKYbsKno8cb
	RjKm6q2EEokds2JrZxRLi08b4rPpaNQ+jJRA4Z/XE8141kmQKBpUq1mdgyPmJXpK4
X-Gm-Gg: AfdE7cmXeqmRVdoYhc1fkc4Ddgfwg909NDEdqodxyf/MRmcLNvfFs4oRkNs9ka4MXcW
	IaFaVVDd5lNLlCQU4jEn1r6AQY2RywspL6+kQEewfOtclc9TV9euNIHyRFchl0zhd+VRPwSme5F
	sBk5pW67ahTAbpYmBb62gQf48SxUQaHjj3xM4l/zaRiMRFDtUcUiYkdFyknOqT3T35PJTqsNkJx
	YWuOGUI0Stc07f2v4L/mmS6O2xqKhoLEIjdEE7xYxXEYyak9vKsWlOzAWGl7asODnBbALOqNxmm
	BX9Zb8a6PyNbH7rOirual58v+j3dumWUqB+dsEo31Svp6Kt5DfnRDPtCiw87xW8rwfl8Yj1KKED
	PicZlwt+FykDsKwG9SjoR5kneAT/dyRMQpkJiYlfVmGsgvmi9BBX1Q16VB9et
X-Received: by 2002:a05:6a21:1506:b0:3c3:81c2:fa47 with SMTP id adf61e73a8af0-3c3ad7a3880mr21206289637.12.1784650304765;
        Tue, 21 Jul 2026 09:11:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:1506:b0:3c3:81c2:fa47 with SMTP id adf61e73a8af0-3c3ad7a3880mr21206260637.12.1784650304209;
        Tue, 21 Jul 2026 09:11:44 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm678017eec.21.2026.07.21.09.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:11:43 -0700 (PDT)
Message-ID: <90548090-8609-4068-bcdc-814963edbf71@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 09:11:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DESIGN RFC] EHT/UHR Critical update handling
To: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260625050326.2946848-1-manish.dharanenthiran@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260625050326.2946848-1-manish.dharanenthiran@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vFqHXzz35vqJ-QZvsQnVE6l9PChjjRbP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3MSBTYWx0ZWRfXxHuw2V4OE8PV
 n1qGucjPyfLQcGT+tL1QfRu7QDBsTLKqspr01QQszM0iNTyXhJpQVdb9NKSm59OGmkiFs30U4KU
 s0V9E+hcly4IhjTPMdKqvVNwOUdiqjA=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f9a41 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pIbJr0qklbRdVuy0jGYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: vFqHXzz35vqJ-QZvsQnVE6l9PChjjRbP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3MSBTYWx0ZWRfX/c68Hc+hpdOg
 /iEhptsSxv3Kb33VZGEmJ8Mz74b8KWybhq1w8Hj5AsNJiFZD4/Um1q0hWYm2D47EISi+E1LSxQc
 NKjC0jbf4vOCXSwOn+oITjV1JBsQlezbes07M7FdQKK35/twoRZ1uoZFDIM7H7vxC6UKJ+t36td
 pC9XnomyLKElWVWpMGUEqwrLQUCPfyuQx+1XWrCKLW9FdW3n/swIZd341xAo/Gbb/EdVf5Nn4XT
 2EjLt3PRCvo2z9NQV7ZElrBAQ+7LjzWszhXxrI474hY+maqaTMfj6Y43BhjZqsGWbEIDzxieiZ3
 IXCAkvQPYEP6mhs0P5DSSsNcdjnriBUrxSbOZWr77GN1TVjt2L0u0Rjii5k8vxhLilaVEhKyx6/
 xnDQlH4oKPtPXux9BuHkmOUb3Pqgnbo7wPfaj6WhYXZIqY+pGPOHaG4At5AbtTzJF1X67eckZ1i
 O4rADsIFeNuGoucWJ7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_091145_951673_E8935E62 
X-CRM114-Status: UNSURE (   9.55  )
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

On 6/24/2026 10:03 PM, Manish Dharanenthiran wrote:
> Hi,
> 
> This RFC outlines a proposed approach for handling EHT/UHR Critical Update (CU)
> procedures across different driver models. The focus is on ensuring correct and
> consistent behavior of beacon and management frames, while addressing timing
> constraints and scalability challenges observed in the previously discussed
> approaches.

The Qualcomm team would appreciate any feedback to this RFC. We are eager to
have an upstream implementation of this functionality that can be leveraged by
all AP vendors.

/jeff

