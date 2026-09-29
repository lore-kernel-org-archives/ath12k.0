Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF418CA5FA5
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 15:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oo0o+sVrULwBqvXSrWGzBfAfBKla/hjOjEt5/j+BmaU=; b=sfaOoTJYFDdxZIsL2Vy11v7fPO
	NyifiCYvDMLQ8I4NxRnBVFbNCrAA9Pz1Id7ixtA67MjCIYQx71EsrB+7xdaDFHau2lvgMho3/uJLE
	q+I/5qPkvLMoGNMXxazzZaK9UV/vQdPiDFP2OL1/0BbYTLMQCBBDeRZNHApMFwsGjdQCrbi3b1aT6
	ztFCY82iXFRzVwqX1q94PWygXuX/UfIMXORx/SZUY9eL38yqzeuQiisG55ToHTmChXCRQkv+3llk8
	BvsiBOY9bfO8ws/9AHM6QOM8cjk8iP+E7Qlt5Gs4gd+d6us0fdBadXa2r7QW+PCOmkM1S5QGVugwf
	FDoM142A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZvw-00000003xKK-1Pdj;
	Tue, 29 Sep 2026 15:39:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZvv-00000003xJQ-0DhJ
	for ath12k@bombadil.infradead.org;
	Tue, 29 Sep 2026 15:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oo0o+sVrULwBqvXSrWGzBfAfBKla/hjOjEt5/j+BmaU=; b=Spp0GO34IYsN6FK56DYnlZIOjC
	2/RFpidk0AEFWBL5pgfVvPw4IWLW9xIlZFvIjSVij1Ir4pY7pU2ctxfhCpIrudEHmQGg3ej6mAJBD
	mHIrApJi9WXGlna86bd1tCToh7udgL4Sbe1zGlAD/aZusir7LPvbRcrpkrbupl+YNxf4DHmsj0s5k
	qKsehXtH36NQfuFUnBfjRsb1YciNANcPNmKkxPcyMBo7Tmn+mQNux9AkfAP8qWVLyJ4kOQJupca6X
	shNITX0K6cDSy9CdfiL//57eAFfWKuppwlFrH9ohH5XJ2TN2I+3YyrNzpBvStZtR0E/fDdBZTj7uA
	m4YP0jlw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBZvp-00000002nz7-45mx
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 15:39:53 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqeKJ1016868
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 15:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oo0o+sVrULwBqvXSrWGzBfAfBKla/hjOjEt5/j+BmaU=; b=oMSKxddrqHOCHTQ3
	O6/X9ZCcpt4qwGDTbrcuMfFId7FrgAhCz3G2U/MBmnB6kyyYvcPSXYE33egWygpb
	q/UAkR/onCJwuCi81275MSvHTvb3MeopPRalekgM0WRriypBFmMIGIVBenxzLPNF
	Ba8goQ+flVqu9iZtI3DuV4+NTyxfTtZj49w9riMEvskZkDYHArS6LxqF+3oBdWrb
	+Yk6FRaPq9C1UgR1AOcuBuQGY77ypF3rtxbwA0XkR5kcY/u3qcZG7XoVi1+Ax64X
	ugOmAwy/0KHNK7HmrQAYJYsNC3pgk//szoHFWkdBIC1pgNYQu1IrC//+59y/Z3CB
	0w4fvQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxju90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 15:39:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so4139354eec.1
        for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790696387; x=1791301187; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oo0o+sVrULwBqvXSrWGzBfAfBKla/hjOjEt5/j+BmaU=;
        b=M+gV+2oTJqIRVx3iSuT2AE/4X3PUIpUyiEhT7Egjr0J83OLtqcyj6Mf/jMcykYz+iU
         42iO/E8OBLJrgvpPw2QQ9WqT8Ud+FZSe6NXmEgFsQWbxsTU/LAEM36kvH6ckJZG1ei5o
         Y/S4upEJfGG37Ec1Jc17EpkByZNxWoDcoM2y0zCSpXVaLSxYQV1Bg/9GowS5VnrHU6sC
         wUJZ+7YN0iuqx+FxxaYOQGsk+w29fspKfM5JXJhUXSRDrY9IzrQbAxveRP0w6RaaAyaD
         bPOwI2Ovj7X9EG2muUUSaU7J9at8/F+ZJPLsa+GBZ1HAZOQdo5DD3FYRN2SW6n5RLAc0
         HFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696387; x=1791301187;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oo0o+sVrULwBqvXSrWGzBfAfBKla/hjOjEt5/j+BmaU=;
        b=cLRJ2qkzd8XfZR+rhX7DM1teHjZKD7kEyWqZankuqqngUWc/fU+znpVcrgMZIJaqax
         IJ6BtoNCfZpIbpVmcFeWxgIJl7kT8sdIZNDLaXZt3ume+SZLOZ3uZMiE0L+M9lyISkOF
         O4x8v2YWs/l9Xl+JOQG0B29PvSbQgUQq8vTej0pzJLFe5LiDorbRrDLQvjJpX/c5uuH6
         zKyNER3WiO8W0k/qtsD5gotER8YztkhIEDBeAVzLMpSAipcyHNN3XYZhOCnqBby4Un1X
         BatcatEEI8Mt1RnCsFyrtygDxWm9h71QAYDZRuGb0LbcZi6HMPyw0+11plSOtTqhJBwf
         xm6A==
X-Forwarded-Encrypted: i=1; AKwUvBzUtxJ0uDjLPsYHrVfToRrbP7jvR0uHpvsr67VWD3HiTP32j+f71E1DzRU06TATFk99gUfQIFE=@lists.infradead.org
X-Gm-Message-State: AFq9FYKtlmC1VIwApHKB2b0J+TDQRkz5AxbFl8asC0lBqSA83jW55bn3
	bKKZ9CJHGy1pO9G/quKP07SToXu98TZ7ywR56RZXlv8gSq+dJifndzqQg++qxIVggtF1pQumK3Q
	QedJSnZ+x3jAey5+d4m6itMSpLWo9A5Y+eA5YUji9SLAvXQVniFK0GmME5t0HVN/W5bmfvWnd
X-Gm-Gg: AYBFou19MVeD8X6YcUvWK1+IQsYtcbhoZNJBWXHUkjYa3AXlLLvKBgeE55g6PIbMP+j
	+dhnQ0xSZc+QoNI9BkyEY5N9kSGs7UCUmrK6vba1f9KNiOR79AgfVyEO8B+6AZRKxGVrHuelmWB
	uLcV5zyAlKQvLD+w+YL0LeRFqZpFcxRnG365wjGHW4FPbireKfLOYBAVmhElim/xaynFdRsZJkU
	YakPJOoxvO28e/5BwP4MI39WJo4cICkWAmX/w2UnhU0AWaflkqQERjRf7/DafLwMM7GSLKwmkwD
	u3WvHvZvs7CBUbEDBnXDMvxwapvKg8panIpEvPGSW4cSDtLgYJNskHzuL6Ui3zodNOvF3ZcDmBg
	gjgjxiexrzbP6X/T0QdLKKuDJsJ24Hx6NrXGO/atj1WMtJc+9uwxO2P7i5xqL
X-Received: by 2002:a05:693c:26c9:b0:33b:b0c8:73d2 with SMTP id 5a478bee46e88-3426fccb337mr12767180eec.3.1790696386690;
        Tue, 29 Sep 2026 08:39:46 -0700 (PDT)
X-Received: by 2002:a05:693c:26c9:b0:33b:b0c8:73d2 with SMTP id 5a478bee46e88-3426fccb337mr12767121eec.3.1790696385980;
        Tue, 29 Sep 2026 08:39:45 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c350be57bsm449540eec.1.2026.09.29.08.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:39:45 -0700 (PDT)
Message-ID: <61215980-3b66-4e3b-8be9-f8f6de94cac5@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 08:39:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260929
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
 <126186f5f19d13dcb9ff0618faed010adf1afee4.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <126186f5f19d13dcb9ff0618faed010adf1afee4.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfX5ArlpHbF94t+
 5/WIn2lmS9sg8N0zrskPrNpVKJ0QW+RetBugJ3Vct+tCeMdC/7kl8zbjxhxo+fqTzRsk5Bu+2Ay
 sQJ55rcxIq7VlI9dRu2Dz098C0qczsY=
X-Proofpoint-GUID: zeA_jcWmcAfQPlxv_D_GAp-z8AmOda0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfXwpPyE60Gd6M2
 JnwFdXtlcUd4fxxuNC8Iz/HR5i4SJu7JwB8Apj1N52Iy9TU4CFi2/RPv7De0VkJBSJV0uFqZAzP
 eYVKlI7gmP7vzgKVQQhxPwncKeiY3TQPPwiQ/yDJ0ELldVJfa/2pA+OiUw0ekwIUYeTyq1EEjf2
 4jDj/s7MT355UDAtScVVB1jX4PK16V+LDnvVxqqb2wkhWWCjHWa2QCusN4t40OElXtvWeirIMc5
 t6hkpsIykMdSkGHLKo0lxw9FrPsC+5tl1SeitEhwXgcpKJxG4W2ZDySIKB3kC8+jTbCK0Fsr59K
 ZwiVikjZifNLUeXf9tUT1WzWOHGDM6Iz6gqqSiYOa1C6NYXgYVKoPkEyaw5A30Ptbh5o2qKMbD1
 jrQmlJZn0EWvDSfJIYtYwC8badF8Z+Q80jSIDj9Ah9Iwf0aiYFSDEoLP4KEThypXAGsatAa10yA
 fpXAMGdMNrBS2texhEQ==
X-Proofpoint-ORIG-GUID: zeA_jcWmcAfQPlxv_D_GAp-z8AmOda0x
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbdbc3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NGaSfe1XjQSTNm8fpUcA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_163950_725987_0A4FC293 
X-CRM114-Status: GOOD (  13.11  )
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

On 9/29/2026 8:14 AM, Johannes Berg wrote:
> On Tue, 2026-09-29 at 07:58 -0700, Jeff Johnson wrote:
>>
>> Baochen Qiang (1):
>>       wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume
>>
> Hmm, it's complaining that the fixes doesn't exist, and that does seem
> to be in wireless-next only? The patch/PR applies anyway, but does it
> then cause a problem if the fix lands before the bug?
> 
> johannes

let me revisit this


