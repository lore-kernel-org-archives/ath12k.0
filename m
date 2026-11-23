Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AE5606A31A
	for <ath12k@archiver.kernel.org>; Mon, 23 Nov 2026 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qXG8IUqv;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR1fJlMt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MBa2qWGM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=; b=qXG8IUqvHolMaT
	zBQwdPBvUJqmvFxBOqkKnk5zpjV2gQg+opOarWBRkHY0B/oakP+t2yAMSLPqEhFRht5CGzaSql24w
	1gl+5s0HSMNNfWDIy9KBIK3lVIG0IKN1Voa7VdP5nCMKuzX2pF9W1RD4kZ2V5VfVB7GJDfes7dU9Y
	Ph12idtTLzfASRVyQwSRJgtugvyew/zV5IPYWJEdyH6WcJYiyNgH77C3nwkhG8vEeHdBvshnBXVCy
	PCW0xhcsntE0pLQIGbhXsu1ASlO7sRrugPs7sKK9BhL3D+epZz1MS6R+WcWOpw+Wm2x3TamIJarBi
	4L9xxSrpz2yShx/6qcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWN9-000000045Tl-3tDi;
	Mon, 23 Nov 2026 15:54:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWN7-000000045TD-1qgP
	for ath12k@lists.infradead.org;
	Mon, 23 Nov 2026 15:54:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKrjS2369069
	for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 15:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=; b=VR1fJlMt4WmeCj/9
	MGhs9jNJ4GGEbFs+HFKXU65iNmMWlrSiSCMdRLD/GJb3ZEEuxdWeQyoB+4jBvi4k
	sWcC0X5u+pdJ+Z4z2tkXXTQ93G0GQ5V8Pn2DI3/6AA8eXVOIakbVqcvDk4aczLsK
	S5BZ3GwKcpX9fi2JyR3SyamK19igcSpo1g276napf70pl2O91dMns5iB7vyfO6PQ
	HW/1Uhk/vQFwUOXiNcDislXDqaNlBMObGvWMRTgODOsAb/1NdVbn9Je0ViD6G1cD
	kBmpSaJ1SB+EbJu+8cmg1mJ6rDcZFbWxGQBgoUlRvxUWND3X+Gd+alTrM6YHbjFT
	A6INrg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa5qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 15:54:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386177b0516so9413484eec.1
        for <ath12k@lists.infradead.org>; Mon, 23 Nov 2026 07:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795449263; x=1796054063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
        b=MBa2qWGMA4yOMVNP84uPfZZYM7PnDjPjxkbziZ6ubskCZTUxKIXdQ3AMZBJ9aVQ0ZH
         vCQxZh2+mPeRrVdVh6EyguuZ5ndN0xqxe6AAu+Z7xwICbdnS2g1Qh3dTqIDY0CBni1mm
         ELDxz7OsZE5g2VzXZv864RDRbB7Q8dLSds+5/hf/0/2Ln1TGgPMORxORoM4XkOZSrWqi
         U4jdbluoL0/U/zqWF6YU1w/iCLhwGI5BvPPnxgjcqd4IXoPg4+vuK/p9SX78M3x0lrfl
         cPsNj3VMCEiPmkqMEuUvC+kQa8ppdb80b9I2zshJqQR1MXoZy/vBzsWDvXV8bgaD42cx
         qmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449263; x=1796054063;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
        b=moSiC013jM5iF/yHSZj+iuRhvqlx35sovjGNGOXYR/paoU4Oraz7YwimSjeufO8Ebe
         C7cUNNnqAr/DFT1xWA2ujMZWqYHfxbCSBbJDgB74zFn8L0jkBJSyePY5PLwoQwEC+edp
         mgbNpD5P4jdek37HT0/YCNgvJ+Bta3DKjo5nNUXkv6SRNrwh2PRcfZFN5Z7DMJpyGbzZ
         jyllBgPhyzkpHK67ne6/vzgM4nVzx+XdsqE1HQwFaQvftSrsBzbIfDb5ro+EPzwmZ7cS
         hmyYJxNjMcetAsiIEXuURyYLBHYBDPSOJAWqML3h7XoPdgpE+YWb3bIB4td1s/eKuHRc
         qjVg==
X-Forwarded-Encrypted: i=1; AL+hErEdt2XArf8r25vajU0+hkVPEhcBK45IfmvCR8gCAzeILAVrRas9U9gVirUXyw6NS6eUOjrq6ME=@lists.infradead.org
X-Gm-Message-State: APuU4Z+emUYXSzDGkaRzkXD4nKG+GajVSREFtmSOUujE4DQIaWspzbVR
	I5qymV7BtMG/pX3wOAhTynInDYL8n6vE+XJXcbz4BjOqBqNSvi5D7akAoZMAQ81vsl3rUb4Ov3P
	AlWN2r3rwqV3potSlHe5hOkz0sDclaOhNw8Mf2I+PkiMmRnIdTjqRvlyCBqfr04iU
X-Gm-Gg: AZFdTZdmbSQOz4vZkfGDV9BWPDgAHevmrSdYsllT6rZyl13vYF+hNEQ0qUgK3fkKwV/
	4BJ2W6BEqO4S1zt2hNE/yv3q7wssQ5+ntruTrVPE7ZMqptfwI9aYA6iYQVDa27QA2rgwOeRLv1n
	5uSxgOPCL5Rg3xDEMASLvK3Bw09rLUb9Ie4ov4BNwG4EmPOugKaQNcIPb3PdsFib1Z5qhSLDpyz
	LLQMVXTR8HpsX+3MNDpTn8sRWtOI4mJj/Ql3ClNdW7e9hGUGJIcneWUw9lu/kYChG2yRXU3HVxx
	fD1OcO02Z7QIFRs4PN0OJ9ltvmkxTtaNZCRGdXKA7NhxfGx1boSYWLZ563weiHChaPwwPFv7Nul
	6E+UP7HaCMrmJ6iR55+cvvttQ+wVaIE3+A/ZqxBGad6gRTezF9KkD9ZdyIvj9EF/9WtLJmY3/Jc
	5lLj1J/xuFZZ2n5nVJGy+qP61aV3r4
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr14886548eec.12.1795449263192;
        Mon, 23 Nov 2026 07:54:23 -0800 (PST)
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr14886518eec.12.1795449262503;
        Mon, 23 Nov 2026 07:54:22 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm40628761eec.21.2026.11.23.07.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:54:21 -0800 (PST)
Message-ID: <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 07:54:20 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
 <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
Content-Language: en-US
In-Reply-To: <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MyBTYWx0ZWRfX1I+z5VJZ9+rs
 EJNrxxsxDAsUDV7k6EaSPsa3gSdBM2GKV244d0cTBhBb6gqyXczQezV/HdSljGUzR3004pmoLsM
 0EqzAgoE8CchI1qFO51vfKjJVEWLQ7zV1UoKmXJNjS8+L7fH6YD2RP4mee5f00Y9jugTWK9cfcF
 hHqGzOSINPb5xXDCgjzwL55/Mnlri6n0tkACNo2codgKEbJK4nMFamweRi95I6lT/XesoyeqlI9
 vst7MnuZknZqBaU/pyd2mTcn/DACNyYcumD5F2LU+BahB0g0keIKqL5c6cQJ8YyGlVOxwYNTIVm
 69X+vzGhC7NdzlSusrN/WBKC4nSZAWSgTh1FodXjzUd+Kf+CIDUTYJ8Itn/QfDLLyRYPotuW1tX
 NSYJLYE/2+EgRPAA3gZjtYAjBybwdTfvHsVVFe+bQrK24OnuIoj+gcDT9SvZzqC6iAeO8VfWJQz
 Ad9rEoiV+yosln7IsqA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0461b0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=wpf9FKuRYqRxeo0qB5YA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: r2vHfcN_pmINgQ4w-zBaHxNmrpH0cGWl
X-Proofpoint-ORIG-GUID: r2vHfcN_pmINgQ4w-zBaHxNmrpH0cGWl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MyBTYWx0ZWRfX3pP/Di0Y25b6
 WAZRe5GayulVO5GdnXadowMYNOmPlNsCBZcMcq3sEJzQZlX704Oifp9SYtZgqpPBDA35Xu0MXIV
 ne4gBAxeGTJQ1v3vw6aOmArFKXFlZVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_075425_487632_7A710BA4 
X-CRM114-Status: GOOD (  20.43  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/21/2026 4:37 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 18, 2026 at 01:45:24PM +0530, Madhavan Ganesan wrote:
>> -  The ath12k devices (QCN9274) feature WSI support. WSI stands for
>> -  WLAN Serial Interface. It is used for the exchange of specific
>> +  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
>> +  for WLAN Serial Interface. It is used for the exchange of specific
>>    control information across radios based on the doorbell mechanism.
>>    This WSI connection is essential to exchange control information
>>    among these devices.
>> @@ -48,6 +48,7 @@ properties:
>>    compatible:
>>      enum:
>>        - pci17cb,1109  # QCN9274
>> +      - pci17cb,1113  # QCN9575
> 
> I do not see any user of this (see submitting patches in DT directory
> for explanation).

For this and the other patches you had comments on, the cover letter describes
the approach being taken. What the cover letter is missing is the scope: The
QCN9575 device support plus all of the Wi-Fi 8 functionality is roughly 160
patches which have been split into 23 reviewable patchsets with 40K+ LOC. This
is just the first patchset in the series.

This is similar to the approach taken when refactoring the original ath12k
driver to create the wifi7 folder and wifi generation abstraction. That
refactoring was also done as a series of small patchset due to the large
number of code changes (102 patches, 20K+ LOC). This was requested by members
of the community who wanted to digest the code at a reviewable rate.

One key difference in the wifi8 approach is that for the wifi7 refactor we
used a separate branch, ath12k-ng, but for wifi8 we want to directly submit to
ath-next. The reason the development team wanted to take this approach is to
avoid the pain that was encountered where there was a "big bang" merge of the
ath12k-ng feature branch with the ath-next branch at the very end of the
development cycle which resulted in a large number of merge conflicts with
parallel development and bug fixing. Some of those conflicts were
unfortunately not initially resolved correctly, leading to instability in the
driver. The hope is that introducing the feature directly into the ath-next
branch in an ongoing manner will avoid those issues since each subject matter
expert will need to resolve their individual conflicts as their pieces land.

As ath12k maintainer, this approach to incrementally introduce the pieces
directly into ath-next, but only enabling them at the end, seems like a better
approach than the ath12k-ng approach.

Specifically for the DT issue, the original version of this series vetted
internally did have a patch to add the device in the PCI registration table,
but it was decided to drop it from this patchset when posting to public. We
can also drop the DT patch until the point the PCI registration comes.

/jeff

