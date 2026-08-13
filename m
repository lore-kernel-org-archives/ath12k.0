Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682D4C5DF67
	for <ath12k@archiver.kernel.org>; Thu, 13 Aug 2026 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5cRTTHqlksMdYebDLk7D8znUq+PbG1zkgFfzQmI908=; b=rJFdd0/0RkSKej7BwNlZ3VIlEi
	qDo2a0hvZnqMcojWIQ2XT9yEXttetx2jR4NAKS/S9jbeLNya76ZeioZot+5l3npW4J85rTRdsa4/0
	S5gL6qNDr+haHr27toqyuzQZ6VjL9dz3jFCdUPtyKIFLSFxxlQ+gel6MBFyRjlR3arrGj9NiXL5Ee
	Av22soIOkghI+Xl1GmlRiSDf+WBycazSZ6uHI7uPyUfSnnyyxC3MlsTlI7ydJLl5nmSPAz3AMX19x
	fNSUK+hAR8wp3m0tsVsQ+iFdJlIX4eBGUMhueR1NpTtLVOJ1AGL0kGMepOF/VQf38HCBPh/OuFFRM
	CUQyvuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYDS-000000019KR-0ELb;
	Thu, 13 Aug 2026 16:23:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYDL-000000019IN-17sT
	for ath12k@lists.infradead.org;
	Thu, 13 Aug 2026 16:23:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTkhI1938979
	for <ath12k@lists.infradead.org>; Thu, 13 Aug 2026 16:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H5cRTTHqlksMdYebDLk7D8znUq+PbG1zkgFfzQmI908=; b=HEJTsvbsQadE5buc
	5XAkfNmgvnlXmyjXSSCddV36MzoP3oeH1KhWVSWVv7JgZsNSzsQnHRR3b2ahTXKF
	6T7zR8V/2R2JMtE5qUmNHMyrr6+yyaXVI7Kp2IY/4ML5oRVB789HemLdWfNeR8aD
	iDg4g0we8RrveyGdtXc1Oo55HzayLpZIm+M2kxknzy6NhAswBglPCCIk4UrTwUed
	nXy5KGyfPQLH+cmL7uTT4ad0/Mi5TK4+PmjazXsSOeThO0zILyJpvAoedEUeDK+H
	4NTvcA5G4eRHiJxBcQ5NeJws4pI7pRm7QyQ0YRZVKVeCX6WQsh4/bzMuapC9mbUC
	lMWedQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xsk4qcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 13 Aug 2026 16:23:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d004f13426so1240475ad.3
        for <ath12k@lists.infradead.org>; Thu, 13 Aug 2026 09:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786638207; x=1787243007; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H5cRTTHqlksMdYebDLk7D8znUq+PbG1zkgFfzQmI908=;
        b=XQV498dzQKNq0gNIDWOrE2osIwli6XbeZVlmodSUwsUf+6k1a21mLKfc1NYTaAwjMB
         KOsqkK8UJFbbL0AjXQgNlFgceeijFat5CB/Q4FCprpNc1YaxZdKjXo1AiVfV57pHmR3O
         E37BBRDt/aH1jpOyboyJPsyPeIOE9py9y+yKDZdeNRFp2KET4E6WkdIQQNrWKMU2M6Kv
         PgodVzGckfHiDx09N+0agzROK/JOEemmubkXQ9pQZqcV3kEag78gOx+FUdCo1DeR6mbV
         JD1CLwm9XKBzFM1QivLtvFle6bsh1638dz2V7d49qWmFSYxjRtRxlQq3fr6kdnnCaiD4
         w/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638207; x=1787243007;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5cRTTHqlksMdYebDLk7D8znUq+PbG1zkgFfzQmI908=;
        b=PFqLYW46f0KhCHfozpL3nT4rasZrM4Z6V9Nt6OlBN+molxySHSARHjEfz2fbRPTyb5
         +vdgLh0yUFjaF7ACHasX2vxRKWKBMJBOy0IqyPcZmRUrQu+myvciu04o7SFYKAeQVHB9
         4FxjKtzlGrp9wEeOXfdpcXgui5CM55FN/EhKPRr1iRceg4Xaw0K7hpQT2jBlFTwdz5gZ
         Q96oKnqzXfWOR5t1ZuCDsc1T9Jj4I+VZmbxV5zxIKybDaPNc3zEj3lGA7pw3tETNeudM
         yUrea1Rv3HcAbGiq3VShxxRiCwGnBfRJh5r6rpziwhQ/1Cvk/f22KqWkWVrXue3kK7/C
         1JpA==
X-Forwarded-Encrypted: i=1; AHgh+RqspuaD26IxSf/UEd5YNunP334aM+vo0ZGOnGtAiW3o9NvtlNVXdhl5psuYqRClEY7EnhqYxwI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCOM6b55uw5AvmW7j4cGQYkh89keGAy8nADoKMvo33bDQS5wH+
	isSaYG5om8LArWVroj4uOTXbGNI3DPs63ZqNYjGKPR3aLieuWTbkj2YL2u08w1VSxDL7CYDuUcs
	fZ9hCydUitwPvZN71EuTh4QZ6moFSb7Litz/KJq9XK6hhmSWZnqLYBnBM5fF3gkP8
X-Gm-Gg: AR+sD10ZHfDqA4WEoj4/QvTEgbbFRiU3gARSn/aNiTLQQlq/FCeVkRZtKkCjrXjYUch
	C7zAb/nMXGTBy3b+8jWMyJLq6Pb0Ywkcusy6wiSwZ46h8UTnu6O1qXMFrqC0U23T0a544JdZwfH
	1+kmghTSqf3Th1D71RQUv0GA/KQUvqgzpTSxWS8N3VVsxQBmqtXh1mRY8FPAjOS4cuisC2177pq
	nfREph6Zegn0ZntQBhSYFTGvy6Xb3u5bMuV5tGPcoqQmSnTngVWsw72g/X/NsUXcffBuqxCw9sK
	qfUAf1LHKaxppol+tS+PWqvFmQFYzoThS+8yHpDDsoFV8Md6axb4FEaAVVmNXklbzqmcp2omQip
	SVSHZ2TUOx+y8KBTZGxqVe2KBxeE2DnEaYAmU8kIaM7zeVWOLiClZUy/A9PWk
X-Received: by 2002:a17:902:d4ca:b0:2d1:1f73:3667 with SMTP id d9443c01a7336-2d37d538406mr75749145ad.1.1786638207330;
        Thu, 13 Aug 2026 09:23:27 -0700 (PDT)
X-Received: by 2002:a17:902:d4ca:b0:2d1:1f73:3667 with SMTP id d9443c01a7336-2d37d538406mr75748325ad.1.1786638206748;
        Thu, 13 Aug 2026 09:23:26 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c2000bbsm13062545ad.7.2026.08.13.09.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 09:23:26 -0700 (PDT)
Message-ID: <170a200e-f0fc-4e8f-a7c6-72294beb185a@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 09:23:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] wifi: ath12k: implement custom wake_tx_queue with
 flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <0b72231d-59f8-49bf-82a0-76d2c7862729@oss.qualcomm.com>
 <20260811111405.397112-1-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260811111405.397112-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MZwkEw2KgJz19H1YzDRYawBGGL79RBFe
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a7def80 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7Mwv2mn7B_PKH5WITEIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExOCBTYWx0ZWRfX0i5eTAznxRZR
 HLq1Lv1wAk09QRTpnuveEFzWzgcrvPJz2TllTQcGy3zjCdgt2s340W4823ub1CLGEJQVaYOFhtG
 +W8/UYOp9zTMCqUrCVJ0Vorcdpnipkc=
X-Proofpoint-ORIG-GUID: MZwkEw2KgJz19H1YzDRYawBGGL79RBFe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExOCBTYWx0ZWRfX997GH00dcw1r
 Fs/vN7gvSWpJqPYdWvaOqQK2rD9zn+pubpG+TewUP3/7z/j5fhhj7pl7E+a1DwzeVTvBr3GoKEc
 v8xgNL1ffDexFSUlH0k+u88XkV0BjidlWR0e2piOJ0RGRJDWBjl0jV6MS4rlMjTkSDvXf6TFWzJ
 D8w/mdx9PrOieKvBAhym313j77HbRZvz9hoBASbn/WW+o5PnMuEN0K40ZeLiX0D02ALlSom+dZi
 5zbSCXeech8bqCq6EFKHRYyUs2JIwZWynSaLDfpaLU4HLyfjzJR8X2yeQAq0VtGqZJPrIwXv4qy
 US1Qax7vuJ+PFPemwZeMIEUUBGsE12ZphHlXQMi/4/bBwszr61ThbDVOmfRQXgyBtbmX9cSwpl/
 VGOv7OjOb9+hi2k5uDb24dtP/gC2vLgHjmuxj50f6EOwdrNKodKh60vnak8j90WHXrs1E6ILMka
 b4o4rGCWjIpupCnTLww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_092331_590469_2529D4A8 
X-CRM114-Status: UNSURE (   9.38  )
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

On 8/11/2026 4:14 AM, Jose Ignacio Tornos Martinez wrote:
>>> +		spin_lock(&tcl_ring->lock);
>>
>> seems this should be spin_lock_bh() to align with all other callers in the driver.
> 
> The outer spin_lock_bh(&tx_ring->wake_tx_lock); already disables BH, so
> spin_lock() for the inner tcl_ring->lock is correct and sufficient. Using
> spin_lock_bh() would redundantly disable BH again.

Yes, but if that outer spinlock is ever removed, the inner spinlock would no
longer be correct. So the defensive pattern is to use _bh in both places, and
both of my AI review agents concur with this practice.

/jeff

