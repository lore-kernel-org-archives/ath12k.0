Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C77C44512
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 01:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxTrnDqlKMkDlQHz63CfY1Rsnl1sEhd6k27eGSO+bKU=; b=hZ3o+oAd7ihwadCmBKFGP7KdGz
	7wjihtDH/QUx5O/KkVSr96DBFWp/5MtmKwjOrHAmpr25AagrWI4sbqfzHEpMct4iiUnv2SfrCP79h
	zSr3ELgTI0CQ98e7Ldoso0tfuwoANtWccmQmvdFbipcAIpMfFLVDWKqBxC5QL4+vTKrxyDH83dr/a
	nDLESfHHUZ65aspncD+XAosL9PSkhJAY/wLQQgFNnjFMD48dA7U+BZUyOKUEudnzIzrWSZLZW7hmH
	XkZjbqwIZVkO+zCvc9WtdtBvoucMNLvmP+4ydn3FUWoi35JyAckJbK9ZMTNpijh09DvS+UHbiipCv
	bahnl4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXrg-00000000vyD-3cjm;
	Fri, 17 Jul 2026 01:59:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkXre-00000000vxs-3ePo
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 01:59:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIHOw4023155
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 01:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxTrnDqlKMkDlQHz63CfY1Rsnl1sEhd6k27eGSO+bKU=; b=Tv2tnFIFVIk7RDeC
	JDzFJkH08kOKi1gzcNp3P249+Qx7vT+vT3HEQtzJe1RCepLoG6crsJ+1TYM09lbC
	XyjIe1D0aG+ka7eDOKfFJuvTsyHBvM/Cv0CNeHiUog4EW6amDuafvXiVIQNzp00m
	AzgyqHrfQq7u4yzIw/EHUi26Aln0+JqnBQcy+5ZIinpOcXUCAMW3ConAZ705IiFr
	ooxFd9/6mFZobFjhafR1csR8L6td66gnMT+M6dNmETr1YVxRK/VZtqiliaFdNivu
	eOEO0HTyodlMtbxDi2JQdwgpZu8nnWpoCr/8Ah1fkLHjGzFi0fGurmsOVyEj/Ym5
	xgXTow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8hjhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 01:59:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso3033946a91.0
        for <ath12k@lists.infradead.org>; Thu, 16 Jul 2026 18:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784253586; x=1784858386; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxTrnDqlKMkDlQHz63CfY1Rsnl1sEhd6k27eGSO+bKU=;
        b=RILb7NTKkeALdfEKxpfKrV1eFozrDtzh3cq/StZxOzVP30dcl/xZAl1yzB0hBZDdUF
         pqAS56zKrrGjqXbQz3t7bCJkJv2el8m+ZtFeMNDvJO5loHsrqVcwzqaTNA008VC55IpY
         4uvkgkhppDG40Xz6L16AbO+LaBlY4hEnfvgqQTeXXzKcDhVyzLJM08RgKSFV3GXDjMlk
         Mp8rdCRN7W7+83CwmyIQS34b76Lr4OsncMt5GETaMfc36J+oEG9ZwuIF2ZCn5Zf/Yfx8
         kdaeAcBPv9omoPEH7jlR535p9/dqkH0R9oMzLjMbfIi+DsJFiA8o0vhq42+PWwdIi+rV
         tW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784253586; x=1784858386;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxTrnDqlKMkDlQHz63CfY1Rsnl1sEhd6k27eGSO+bKU=;
        b=DpAcgAmi8Vb383iitIKW0JXZLGTPLlSpnDo2um8oYPl7UHyGbToxPPHg7BRlFBmX2O
         Ni+0psXtfHphcjGxkRC4es6+/oHfBRoZ3k1YX5kqy0X7McsDACXUhRPdhaLTEfOJHC0j
         eiNqsbXaCadrVOX9YDjO8P4vNuwYAKK69F97g+XaWMlTB+GeGE5iQNgLhIanIHvf2qpn
         4Z+7jsWkGAm0txSO395fshne67AAkfOEkr2ZQEohjNks2Wx2RnN8ECgIFXpF8+IU/NfV
         J+I+jHx/JO/V7JAgCLtfR9nS2yfIxPQl6TSWCEMttXLDQG9una14Gg3fr/UUbGb1Oc59
         Tm9w==
X-Gm-Message-State: AOJu0YzQTPj11cp4/771xJWX1rwuAKTdIYFs0XkKYRsLu+KDG8Q/qGAg
	UydIlgEYpum7mXTSPIThue+b0Efpdu4UyJarG3KKHz3vi1T+TsG7YUxBrrpYbYxAf70FcCxXFwo
	po7QAOfu9+6YAOva7OLuaIuIUg4QhbtAqPF2LSVM7AjWUz8ewNEAFhzS1dzpTBsdcYyQ/1+c4
X-Gm-Gg: AfdE7cnGUhhXjqdDzxiEfFI3yY7DYt8ZgWAZQgSyhO7S+JncQruW9GHcxFPp6N0x28P
	OIRHw1eqhsPUyO5ggYqdDp8aoWfl0e6Ypmen6LnstdX4WVWY7pFkcrqvkLFJMN87zniWmQG6vbI
	Jn0jr7sptZv+omuZ/c0PmlePr60kcSxfO2GFnpH3CblgBSjnvAllhsLEHojRkD8YTU5Buo0i7zZ
	HxrrHyNLsD0kEpbCSQwJLX1jzksL67yZKXtFAxEvpkOnmKgZ1lelqfiRb2WGCnrLyfaE9wYNgoa
	v8Cxqa1v2ZFdCUAoGqyYs/dvTyzI1VAkMrOGw2+limkAFD5bzNfcy4xGUOZsNsU0qQN14kj5TES
	gLODsGvfBjcWS+GTWaZ3Yi9u0j4FCl59Xedqn3uRTJ0hB3FkJVu56ii+UPI6+qvkAMtcDbNtu
X-Received: by 2002:a17:90b:520d:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-38e4b59bd1amr515430a91.30.1784253585612;
        Thu, 16 Jul 2026 18:59:45 -0700 (PDT)
X-Received: by 2002:a17:90b:520d:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-38e4b59bd1amr515401a91.30.1784253585113;
        Thu, 16 Jul 2026 18:59:45 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e47ff3511sm226044a91.1.2026.07.16.18.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 18:59:44 -0700 (PDT)
Message-ID: <5ce57e40-8fe8-4cfe-93e0-950965c0313a@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:59:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Set DTIM policy to stick mode for
 station interface
To: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717014302.284034-1-daizhuang.bai@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260717014302.284034-1-daizhuang.bai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SNQYfwfd57bZ9RtJUqFgMjZPEbrClkLC
X-Proofpoint-ORIG-GUID: SNQYfwfd57bZ9RtJUqFgMjZPEbrClkLC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAxNSBTYWx0ZWRfX+42jtEYzMbvG
 rKJsF3sotKx3dElTPdX/mHp1xEoSWSN6CZBKEllehXhQmOI6GLgZS3hbDds+aubdHw9YJIkbwL+
 bz3ZsS4/+ytJ4ok4kwPse6mDWXubpTM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAxNSBTYWx0ZWRfX4PGaL5uVfTsX
 6aMz9KE80LHody0BXhxflD85lX8dVjVP/eS7kfAUQef7ituQAczA1Te2noMiQo7k0zQ3P7rT1lu
 hUILX/wEIK5iQKqmZEy3Ucg5Q3JOvgmISdAxTk2CvhGvlx9wAZgXBTj1w/o4xmdXU1k3jD32cFW
 UQSQbydWYGi5fXYtdzUB+g+2DtNqwDq73XJ8BPvItBEdk24xwLevgWXYneJgZ4uc6HOF7KasFAC
 iNj563LQJaUl76Em6fdPVDbrv/bOHnV6hzXPd2uuPIZsIeMjqHFhjsHqo8dL8BxuFf2xlxZKwPN
 YGEmH4Eg+9FEQv2Nqp44mc8jdAkjEX86nXaqaYXTrP6lLP0AJyejqvmJJuJRjQweuQu1kUpqk4M
 D/iWz3qve2eCNG2u18/X2d77WWe0c1ILMthVeha2m/QmHaHlWRNnNSfrf+Tf0XBkZvTXORW1QBe
 7Y2bkwgnt9TY7ct/Afw==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a598c92 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PIsBSLMAwA0o3fhTwyAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_185946_915246_D49F9933 
X-CRM114-Status: GOOD (  10.45  )
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



On 7/17/2026 9:43 AM, Daizhuang Bai wrote:
> Currently, the station always follows the listen interval regardless of
> the DTIM value. The DTIM function does not work as expected. The default
> value of the listen interval is 5 so that the STA wakes up every 500ms
> when power save is on. This can cause a data transmission delay.
> 
> Set the DTIM policy to DTIM stick mode so that the station follows the AP
> DTIM interval rather than the listen interval, which is set in the peer
> assoc command. DTIM stick mode is preferable per the firmware team's request.
> 
> Apply this only for STA vdevs and only when STA power save is supported, to
> avoid affecting unsupported targets and P2P client vdevs.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

