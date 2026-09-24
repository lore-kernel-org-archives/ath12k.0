Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CC4C9830E
	for <ath12k@archiver.kernel.org>; Thu, 24 Sep 2026 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2qmIEuI6K9ZfvbWp+8gw4YZugR7p65Nd4cMUpTi15E=; b=e/Jq74jEoLdeOlCajE/J7cyf/Y
	fzolFmpQNhE3AcfKt6SKTr2nrq9UvcPBGRpF47c5ty89S9/eIdG2CHx3lXkvsrma7B/1DecP/zfYK
	Ff6xbENm7sbal0/8mITxdam83+ignhA+7tKrRCdW2bLiV0H8naJE6vqLszJv3LmsFToJxlBrrr4JX
	jfQmMlWS2US9agmXBU3ZlbTMVt6wg45nmchQVDMG4l/SZIGhu0VBjlzNYj0b6C4BlYcaldcmRmGQp
	gvAPJInBuDWvBOdcLX7bQ6XMbFociCCIsuAXaoxbeS0bS4GR29QUDxdkQ/IxR8vSk2M2T6wPK8vcw
	8v0Cp7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fIG-0000000AWd7-3rSG;
	Thu, 24 Sep 2026 08:59:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fIE-0000000AWcd-3EXZ
	for ath12k@lists.infradead.org;
	Thu, 24 Sep 2026 08:59:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eEUb4147379
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 08:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2qmIEuI6K9ZfvbWp+8gw4YZugR7p65Nd4cMUpTi15E=; b=JJxPL0jcJI1kru5v
	q6Cs4SWFyAH9PWvEQ7aZVwFmh5S59ChGAHP08SrxVlmcNa2LfF/r1CfA4AOQMp7O
	cUk6to1M5uQ2P9F6hXdelRkQ/jW2Az/C8mMKlf8yKay73yL/RFvzOhMqTn7jl1G8
	KJr1Fqko3frE9HYjbya45M49vK+l0Nan+UTt4yRPwHixcwhRNImWmG7QObrmPRuX
	/5dsK0SdPG+YSOloEMohNQTt9IF+2TIhYTGNi1eWUixY8dAQgh2Grh9CYW/lbiN9
	+fYJHIuArdk9F5tCYNkUwWMszFUo19eFnBzSSc+1DXLabK0ik9P2TXaKCutUUxfI
	cAYcNA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv46rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 08:59:02 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1437272611eso2843121c88.1
        for <ath12k@lists.infradead.org>; Thu, 24 Sep 2026 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790240341; x=1790845141; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2qmIEuI6K9ZfvbWp+8gw4YZugR7p65Nd4cMUpTi15E=;
        b=Hxiizm9/4HxGobnDontQQPyoTadkElmnAMOAze+AZk4FnooaSGXJ6Ak1G+Up/EHZJN
         ntJ+yRkdYTar78+TLjb3tlWEgD85iczFh1l7j8oexXcfqmPOasgAfOTDPKb9udmo4wy/
         KHSC3BgXhuv3DK83c79isGQqDricB8B+UyHzYZexwnerw7zCPENEEa8R1YPFqjElNo+z
         8G9eVrCHBELYZ6R4sXQKR1zNOvyVE6u41NPIoKGHV19bYFtISBgbLZ40cPYZ64QFzOfE
         MST53xBFrF/5PDcsUn5AvfkYyr/9QSHMFiDNa02u/ydAnrVMlhvJureoTeqJvPJxCh26
         1RJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240341; x=1790845141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2qmIEuI6K9ZfvbWp+8gw4YZugR7p65Nd4cMUpTi15E=;
        b=XKo+bpDlAJ4q8NbFKHziRCQHSRPC6M2QOiA+fF8Y80n9C9+irPohtRMJh0X1xk/PQC
         ktIcTNsLdXyF97sJ2hjWne8cwFlbSzHGJUUKHZPcKGwfwp7w6BOeF65QyQWqLa5hFV3a
         bkRK/L1Dpniftud1SaOeRLc4Xf+acJKYOR6KGlm4ohllpgHDcXC8UzK7kfQCpkDrWNq7
         NsSo/SeBfgGQb4uy3PXh8/zjR+y8y3zah0zZwSwx3+FKRxaCvLOK1n5TY47Vqarlimas
         blFqw60pLoDH6TKmQcBPeOuD8DeSiifs44k5b1lGPhGH6NtlCMEQqqFw1HEBthW0sWky
         xS5w==
X-Forwarded-Encrypted: i=1; AKwUvBxRD3HzSM7gwEYqIeY3UVvA1Xnvj5/gDiuxmZKLGLfFAsjQY5N+v8zZBoZePQx5gFQ43oapFtY=@lists.infradead.org
X-Gm-Message-State: AFuF++mJcrZzoiNKr/S8GSHvjbkPJzUGu+ics0INVxKejeMiircf3f2M
	zIOrCMo6mERUTBqKLAViatQA+qEGvv75scrxEJM0o8pMomI1D26Bmc/LqEHXUr8zJxEq0XGcatg
	nX15hs0k0Oj2g0u7eihrKAS2b0bHxHnyVBGjrwvxMwwx2MRwUCYznkmjP7qEPnPfd2R2UEKR6
X-Gm-Gg: AYBFou1RnIIZLhvQJKQ1ZcYpUeamFEo/NfXNhuN59y4EZ29HmvaxqABHX2sK7OeAy6i
	oM1vcFiuEOkJ4leDj7WL5Q/8ahpOf7pKqy133g/NUY7v1HMLgdH4/jKgK29w6OtknZ8VjlY6OfL
	L1Seu49wOILoWSLO2NpLRO8U/AmScOIsJoIbgVDApHwsgmjWZJiWdHghTLjVUG1j+OerdGkRogo
	OwqO/pB8N/itKYEflNF8yTff0n38wOQIkDRkJGOkQrggRXd57sehvL3Lhb3CVhH500vvyPFWQVS
	4JAyqP2Y8sgE8eoyVOF84ECSHZGMS1R7fnmdqmkNcJlj0XcdCLyDx7EekEN3tOfUgD1p3JtYhfa
	hK0hbzrO7bGLkEhLdnmmBXNeHXLWLjMtVUw==
X-Received: by 2002:a05:701b:4241:20b0:143:5722:55ce with SMTP id a92af1059eb24-14503fcdd8emr1532949c88.38.1790240341310;
        Thu, 24 Sep 2026 01:59:01 -0700 (PDT)
X-Received: by 2002:a05:701b:4241:20b0:143:5722:55ce with SMTP id a92af1059eb24-14503fcdd8emr1532939c88.38.1790240340718;
        Thu, 24 Sep 2026 01:59:00 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e51asm12621558c88.1.2026.09.24.01.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 01:59:00 -0700 (PDT)
Message-ID: <c9f28565-28e6-46d3-aeac-c78b6d86fc32@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:28:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2] wifi: mac80211: Report parent AP BSS
 parameters for AP_VLAN
To: Johannes Berg <johannes@sipsolutions.net>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ganesh Kariganuru Mahabalesh <quic_gkarigan@quicinc.com>
References: <20260915052923.3300269-1-aaradhana.sahu@oss.qualcomm.com>
 <48ebf25d157b8c12dff724fb1f6a97a0b45849e0.camel@sipsolutions.net>
 <ddaf2702-b33e-459c-9efd-098feba33243@oss.qualcomm.com>
 <ee25d1c927d4a618384eb05a210b0f9b2147d055.camel@sipsolutions.net>
 <66e6b21e-843a-44ca-bf77-30441a80510e@oss.qualcomm.com>
 <b76bad90389aad66d9082428f3c969294c6a8d74.camel@sipsolutions.net>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <b76bad90389aad66d9082428f3c969294c6a8d74.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX30AD8UFR0W+q
 4YoMiR+QP2yDlN3+pFtILyWXPSO8PbdxYzimvXMzcxk3nI+gxDwoEuWwvTrHSNtHS8KK+BcwqvS
 /z1bOOICLM6e5Ee64K4MNdSvADp+WltStplwcNlpXmjrIXmy/zuS5fLxrRx2e1t+oKImALRJ1TG
 tAfpY0R3RidWbzQHVxuKcfcHSsO9U5biZin1nvLTTFLlljsrobt13JHA1giSmDFUKYgUwBvjxn1
 y07U1D3YHFhpd7JDn9tPTi0/1+9XZq0D+R+00PMR2nLO2xlvHViDuLDUiQ7e5RPW7mtqKfU5jkk
 OvUsq3vtmKo5YbEuvGRGP0J7q/fSChmfsv6R05YElXGGXfrU6nEQ2Wtu+KnJc68xIc816XD4f4K
 l+V7YBXoeq03RD6hqvDRA99wGyrPceIbpA9Nool+2rJ+nT/3KbZNMfQOL0ok7EV26qDCpUHfDRz
 hKziWT/DRSs76A4Xxqw==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4e656 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=LQgjkfhuwCsdZD7AzKAA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: YRFXdE-19Oj5D5LBVU2RwTZn7AYEBXVI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX3vneLjmVEGiH
 Fd7nWgkCVy/q9tN4N9x7hBDYWoDeRPXeHJ98B1g1WReT+wMSC8amsYYnwMalajaoqtCXr7pI+Fh
 5fsIwFp4VqwAmnCvHJ2KSuBgiUXDrh0=
X-Proofpoint-ORIG-GUID: YRFXdE-19Oj5D5LBVU2RwTZn7AYEBXVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_015902_817382_CE24D076 
X-CRM114-Status: GOOD (  11.93  )
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



On 9/24/2026 1:44 PM, Johannes Berg wrote:
> On Thu, 2026-09-24 at 12:35 +0530, Aaradhana Sahu wrote:
>>
>> Would it be reasonable to remove NL80211_STA_INFO_BSS_PARAM only from the AP-side station
>> information, including AP_VLAN, while retaining it for the STA side?
> 
> I think it was added for the STA side, so likely is needed there.
> 
> johannes

Thanks for the clarification. I will make the changes accordingly and
send the next version.

