Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84967C43602
	for <ath12k@archiver.kernel.org>; Thu,  2 Jul 2026 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIcgPlp2LTkuppvChFPzfoagnWyTaW8m32kqi9i9VwE=; b=FE4BQ8pxU3aCHabbWctWotS/er
	1/0Emu/zG7fk1U4TtbmCrRTBQKAtxF4x3HNxkGlJbGjPRJkFUahVEzvXetwKy5nI/0nen6f94fU/D
	MF+PA69VkdwKyZERow0tFlnV1og5ENiUQBIbwdwpZ9YHFGZ2TKNaeRQXXkWMN5hRnx50/nwrHD5Az
	KTZm2nnXerVYFSbnG/6szIDHSZcEAcK4RYV+xZ4P4KJejolj9zYgAcxyxr9NkelxfaCOJMrXJ9lKq
	Gz/xqYKrjoDzYqHKlW0E3AtGr5vSC5MOVGz+v2LDsFPU54C3J8WK81Xsxce16qcdzh1DyEwb6rq6n
	0CWcc4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGdG-00000004RgP-0QTp;
	Thu, 02 Jul 2026 12:35:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGdD-00000004Rfj-1F27
	for ath12k@lists.infradead.org;
	Thu, 02 Jul 2026 12:35:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628NHd13049483
	for <ath12k@lists.infradead.org>; Thu, 2 Jul 2026 12:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GIcgPlp2LTkuppvChFPzfoagnWyTaW8m32kqi9i9VwE=; b=PfvBRkZjmzECsBBG
	l/C6ulvrOWW4bO5T1i668/9LoIoIo2Ot+p7CPfZm512Yi2E36QZsz7lY8yGaehna
	LRfeXadKYb+gb6eYOF8BiIUQJ0KAdwl9pBVviZn8WLgczw+4oNwnpFa8J34gtGqi
	3vGn3Vf9jKgZ1GgmG9fyB7AeynvUjvAslZT8Nc1Jdd435VXma6rl3XHXShg4aGn5
	WkgGtwXY9nJRza2Pd6UHqASdWQ9JU6zt0cJqiccbZm6zVd8EjPuoGOfivPfBUfvM
	K+TSJEBYu+SKlIEfYHEpZUKipLVSiQXbKLND9kl0mBASZneU1Ai4Ivq4SxZVPhVu
	wV16OQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541vqas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 12:35:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eb5b9d2cf6so3437646d6.1
        for <ath12k@lists.infradead.org>; Thu, 02 Jul 2026 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782995701; x=1783600501; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIcgPlp2LTkuppvChFPzfoagnWyTaW8m32kqi9i9VwE=;
        b=LDAE4Th85VE2VXP50+CCRKaLXirRecWxjxDQccREoewy1u5r2B+qUWaLBrRljjjIjN
         LbIfXi2tSh4UivHVInYjC6j7dX0TDwKohpiED57G14MBz/hNf29fHdiVHPRnnPUouwDr
         DnEAznwMA+9uZU2U2Qn9GXGYjJQsZFGVPVlMT2jX+zvZ4wuBx9V35ttyWy/1lSkI8mN/
         mMLHtgqMpxD2X5HYq4BoKFLahOY4hRJyIU95vHNeyzMA3KwhpHBhYjEhnX2BWyij+fk3
         C0Dx+RR9pl1qu9mSZqDmunCJfRic0/c4mO6TLGD4XVV58Dvu+BmyKrqwZsQQbu0ut+LY
         Gr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995701; x=1783600501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIcgPlp2LTkuppvChFPzfoagnWyTaW8m32kqi9i9VwE=;
        b=C5DVtega8eMI+nzghayQF1Pn/OAjedXvz7ISftqoT0Q1zcbT0vN3TDbCd1lea59auk
         o4wygCzjq+j3gPxr5sHdLVv7j8LX3JCGfDGOSwJU9N+eqhxv7NIM2ShxcePf8LjLU+gz
         gZkCFozW+TFk53HacNN8PDnyxbMgivCJkamdkhU8oJHh5ddDIIeatC6f84p+Ui/cfy2t
         XHNKtdKZVgrA968I1hXDANBfRC3vcosOO02JPOTF5mA9DKFwiXp+JBN232tRfqSdbCP3
         r2OSALXBCbeyMTk+UBqucdMoW2iimIjQ+1CDBEeQ5paKGtBfzyTB08lNaroOUIGtE+N1
         ne0A==
X-Forwarded-Encrypted: i=1; AHgh+RpnzkhYz1zPrPCvqJV8zVoZTZ0XavQoCHF+zmdNU3oCSG8ir6L7fgTnxByyEbNuTgabxJ2Mqpo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjeMMGvvzNl+gsEjEN/MoMkeCZaxvRsbLHRsOesl0xaFpXO5DG
	t6g0vOPxuZgESfhaEz1poho8QT3t9G0vnqUdeWiBlOnKk2e7++WCluqEwLKheTnzWAUp3tgD0a9
	JRO35NAiW35w7u9jvPzBd6bRc7JVvVk9BWCmPIpZVC2Xc0oapWf7xoS64R3TLoUdx
X-Gm-Gg: AfdE7cmxMbQIhJgmJEC9Tsf/Dr/DOGlnIJ+t+CsrRHxzFcp7a6pMdlUmkINSSnqvZEU
	SXYXQoLP+wJya3YzbV2jgI543eEwLUpaEMkuNs6yGnhJdQhnkPb2stiHuAuThnorIqFP1cIvJ0i
	gcR/47AcVMuUSaoDf/R6dWp/jprf5MFD2gtoXDixWDXMyjYF7c8FnkkoUYkLV9n3lbNGmxBUJb9
	ssGoIIUK+n7OLKeNFusH0NCQvbrfd2UETVVp+NKk2Om6Cm/eQgsXQi0EOzfTjDZ9m8ojHTYsXO5
	HhvaCotAhdudPBH89CB1Mw7wR9cPVbZo+wIG8SUA8iRpiHlnOx45Xq900eVmB8/T1p7hNYO2hEe
	GII69XYiD3O7kXJr5YUsUPFAcSgb3gbR3tKo=
X-Received: by 2002:a05:6214:428e:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f3c8ff79abmr50486646d6.10.1782995700703;
        Thu, 02 Jul 2026 05:35:00 -0700 (PDT)
X-Received: by 2002:a05:6214:428e:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f3c8ff79abmr50486116d6.10.1782995700253;
        Thu, 02 Jul 2026 05:35:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad13426fsm895805a12.26.2026.07.02.05.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:34:58 -0700 (PDT)
Message-ID: <46ab1a2f-45b2-4580-afea-a55073fd29b6@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:34:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/14] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-13-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-13-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5mFLYZvUBeXyJBCH0qHPfrNhjzWcVIIE
X-Proofpoint-ORIG-GUID: 5mFLYZvUBeXyJBCH0qHPfrNhjzWcVIIE
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a465af5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5GrnyDZj1TGYcITIosYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMiBTYWx0ZWRfX692NpRkoGIZO
 8O53Jvcm1J48IdvbDqX4JS03wNU1m6HsnkLff8qGy37aFpWyPjG1cDOmH0TkjoKpQQ1Qt+pAQwO
 RhkijJnlvZL52mtBquHCu0529WqSBHuBDULr352AQkSy7hV/zf5hlu4oZCnOmdRcwer0FDg8Z5E
 yPCaEJS6Wse6yACrd6l+3weQHhjsoN8Oo+A6u/o4sTq6cRRnuwKWhHm2K9sBu0IXjXWNMjP5XCk
 dvgleAWatz4Z34bin8fzsmW/HzM7bCyvnfBNSwkgyQqRkyq4s4Licm1pCZQxoLBxY4RD6SGP3cM
 g41tg6S9uaeRXJI1eol7X8XENCcWgosb2cypnGwwwPCGIQpfWWMYdoLgm2dLaBc5oAKD9871YYq
 pa/9tq6Y7la9d+5w8MWyjdkeRQnSyY+bbzhcJUHU6HwRavzCiT9fd2N3SzalbKgCs9gUs3J7WiA
 htMI4PDqBBDMucnCgQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMiBTYWx0ZWRfX2NUs7l5N7iBw
 PuLOZBS3EFowpi7IRAakrTBgyO/1xu5P63wM10BIoPqN9i71GPFJ5LCuxU828pyhego0YsQqUFX
 P6+d8T8PaWX3+BqHUugddiqQgXfvRmA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_053503_456868_C5F4965F 
X-CRM114-Status: UNSURE (   8.70  )
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

On 7/2/26 1:58 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch ath12k client driver over to generic PAS TZ APIs. Generic PAS TZ
> service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Acked-by: Jeff Johnson <jjohnson@kernel.org>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

