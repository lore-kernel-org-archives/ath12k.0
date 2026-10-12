Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88340CA9ED1
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 04:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiXJLSvdm98OdB3WUsJlN9OAMP1fJkkySa991tcQiQ0=; b=ySjUCM64EiVBVkY96l7NXgX8sw
	SsYtqD/8Cuo+TD6y8VZ0Eu318rY9NMmjywcp8G9/6GX8IaJk3XQ25RexHO/p1oNurA1iBaG1G+n9R
	LNcSoa2ajexHkG4tx4N7TYMEUMxSMKrUt1VC3XO5RwOU0z0fGIPf9t0eekmxDCnWLYD8bXGF3zO9K
	4cchGO/BPsSNoNcNjuwz4wo3Yw8fm9NB6AA/61fEWLzL231I68ONPmzOgGzeD431bAKxJxMsXg6IC
	l27SUMtGWwRUp9tZVPab3bbFE36wPLsBrVK2ywpxjrJ/5IGdzddDdiczeY7i8S0pEP/L8mvjJDLyb
	LSF/DbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG7Iz-00000009dH5-0T3x;
	Mon, 12 Oct 2026 04:06:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG7Iw-00000009dGk-39v1
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 04:06:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C1lCpr052400
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 04:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yiXJLSvdm98OdB3WUsJlN9OAMP1fJkkySa991tcQiQ0=; b=TWmVzfywNBEYXauF
	HfojvLbWDjk+NeHdSBgz7w2jF1aOY9BkmnYAB85MZCa0sauVvVtXXeAt73GUiLS0
	+vuOBRo7X+r20aeY/fTC0o10vP8mVJ4descxthXipc2DC5ReZIrMvOLfM0HRWoOl
	4k5qFhMbtiUe6JC+3XMTHuR0bQ0lLVT998XcSUbV0N+kttOCw55UskNcVJbybE/j
	Y7f5b2u+O2zwF2kcAbz3GPC6YPHyra3L7YCuHQ+wqFwRlxKPQ3oSZBIWEL9W0hYN
	71XWVYSQTcB/Zp3E21Vhx1lBGKu3BzRhY+tpviiGV2wgltsKrAvxscskpqdb9G5i
	vYBxng==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9vf4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 04:06:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1254461eec.0
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 21:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791777985; x=1792382785; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiXJLSvdm98OdB3WUsJlN9OAMP1fJkkySa991tcQiQ0=;
        b=jy1OgvJ1/t5NiIT8NTa9FblTeX6PX7SVqAXnRcpssohFCYgdfoKQrocOu1G7ZMuglg
         vSrjLI5b2EBfTd6nFufpAGaAfRJofO7L5ScoPUnfX2HYcAsRxbp+jViQU5rwA/iSTbOn
         ziU0A/qVHp0Myos3f+XvLyK0wnnDGish7jzAwAKO8JBsZupI5Hr06uPx40ANb6zIXyaI
         nUhFpFpM+yQMlxXlaWLXQEVHUoT4I1SQvSYEhz1y9toBIbx1EZ4E+5Vfj+66BXxMU7sK
         T6GIMjJLZFOxj6VcK6RFZGBttrZ0rtz6PMOSoLmLViBrxjzwswfcm6fJge6CfaMiPHqX
         oaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791777985; x=1792382785;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiXJLSvdm98OdB3WUsJlN9OAMP1fJkkySa991tcQiQ0=;
        b=l7HC+CtWYUpwpI616IqNGvvsIFbPRQsFHPzjH/ggOfgoSFtlDc8WtSTl5+f+uXAskh
         0Qh2xjVekKRLKOUAeQ4pWnlItGwPN0GxSOLs5rsDRAul72gWfX7mseGAa/oZjlB4R0CE
         65q/GRS5tlzppVGqRGMYbYZCrJbKyFPJMpa0r99aZMLPTjbIc7pqX5B70Uw4tFsiNJYT
         QTfLNfne7xZ5MdzoGORXp2jYOU0H7MOu4W9xSZQDhU7IzVRipjYkNPHPbJ7eIexO0LAv
         A+CKoIrgSvbZ3I5wrb0qXhGqXBDtCAbxuIflrU39uSop2ntM5kinvDtZp316ecNuKJse
         YTFA==
X-Forwarded-Encrypted: i=1; AKwUvBz3dvtxkEypqSjoevkDF2mDmlPT47L+TuQqov5uZSWyica4E+knMygR0Ne7AJgkMtSCu9hU7Zg=@lists.infradead.org
X-Gm-Message-State: AFq9FYJBQJ/WdT5disIvyd2DzsvXp1Njg+jVkrz6/judzYxq8jXMYqk2
	xGbOQrEO9K85VPmGsfQOlFfOKbfZSp/X/ipqrtmy17i+1PabolWgWcRUTh9F2aPVVBfhNXFJcu1
	btclNIjpHAIRXPcmDVp0IQU1S2sX4kAGFJMUaXOQtXoWWmUJO1uLTbq8POYp/StOhzpY2Kg5J
X-Gm-Gg: AYBFou2zL/+Kzgtsc5LWaAUl91OMkX+1mI5+8nhT1A8jyaJDtNrYsNhD5x2Fankjx7N
	JNQjHnCHDBvF6/391oYSKpJP1czMA2q8D3VzsAtBM0Xr0P5GTZ7pdIdSeLtSEaJUfYmxeqTSeIj
	cr7z2kdI6eyo4f2q52n+HxYGsj3Qu4nxrLv82dIXU1jq6qB4djr0dFUxa40wqcWlyIrLNXymHG3
	wfZDv53MtgkxRaRwbd/0uj+SFpfSgq3yAV9L3OnmcBrrcJrqi8P+KFhl4tnR953aAD3Umclvbnl
	izAKP2emoxi1mF+EtQMltrqix6kgNdTdCStoicqk2nKmckkp79BD+q8DuDiHVqKz+JNQHCAS6PL
	VvMoqJR7fsHe/76QMoymVNs9B1Tb/
X-Received: by 2002:a05:7301:4714:b0:359:d728:ea39 with SMTP id 5a478bee46e88-359d728ec5amr4221980eec.25.1791777984987;
        Sun, 11 Oct 2026 21:06:24 -0700 (PDT)
X-Received: by 2002:a05:7301:4714:b0:359:d728:ea39 with SMTP id 5a478bee46e88-359d728ec5amr4221944eec.25.1791777984343;
        Sun, 11 Oct 2026 21:06:24 -0700 (PDT)
Received: from [10.152.194.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm17229381eec.15.2026.10.11.21.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 21:06:24 -0700 (PDT)
Message-ID: <4b8c6e1e-2f20-49bf-9904-cec2e54ff2cf@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:36:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: remove duplicated STA state
 from link peers
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
 <c03cff3e-b135-4125-9dd4-f9e342a02f8a@oss.qualcomm.com>
Content-Language: en-US
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
In-Reply-To: <c03cff3e-b135-4125-9dd4-f9e342a02f8a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc5cc1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=mepA773XGFEojvbZGisA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: vAwFY5HU2Yz6D6wR4RNqiiNXK0tA7p2K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAxNiBTYWx0ZWRfX7eOEEEVBL2qf
 Wlk0loU3pca/x9XmwxNqKklmqWOzrh3VU6y8bh4u3MdfHn1rUIL6Oi3+TyDQFjPsRjoW4Lne0da
 6HI4ExLNNxfCCplP4/vR+KPgSdlPRVPtGYRNY0vCt9QD7FBNiZtYA4l/at76IsHXkU37Vai91VA
 dIcZcRaZSP+DwvBBn9ZPpkyqidU7ifOfzMcTcwhc6Wtbz2MX4wUuCJUVUpQ2VUiTjQozZAE4Pmg
 +xbWBsRYHuG5/ceRCTBh4wkps87Rc8GZSMexJfryt9EWstHHXmyDccT4fGnsPsuHXXlc0WNxvY0
 nmgDdw8vzGzGn/solElr1KEyeNIZQ/vry2A4waMXUlrcDXkrUZIGHjM5FOQ1vyZSelC8vDhnsqJ
 ZDiu0j2Bk2TvDPoLzlGE+0v1hhbH5kmPk3/KU62sc4WsvXidM34vaUf8BWHJdrVp/PZWEx5vstk
 2jt1A+7ewT2pCRVn4TA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAxNiBTYWx0ZWRfXz73pnIlM+XrV
 tJSpOf9kXxqGqJp0kx2rB5DoheTf8019Dvm4Skpb7ly97YP12SuwW6xWgrBPJU/oWtY4ezN5sEI
 +R0GCtaB87xF+Iyu/Rc+eGDGIARy4hw=
X-Proofpoint-ORIG-GUID: vAwFY5HU2Yz6D6wR4RNqiiNXK0tA7p2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_210626_821558_D7B0FA4A 
X-CRM114-Status: GOOD (  21.43  )
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



On 10/10/2026 5:17 AM, Jeff Johnson wrote:
> On 9/24/2026 10:10 PM, Aishwarya R wrote:
>> ath12k_dp_link_peer currently carries state that is not inherently
>> link-specific. Both the station pointer and authorization state are
>> shared across the links belonging to the same logical peer or station,
>> yet are stored separately in each link peer.
>>
>> This series moves ownership of these fields to structures matching their
>> actual scope:
>>
>>    * Store the station pointer only in ath12k_dp_peer.
>>    * Store authorization state only in ath12k_sta.
>>
>> Doing so eliminates duplicated state, reduces bookkeeping required when
>> the state changes, and makes the ownership model clearer.
>>
>> Patch 1 removes the duplicate sta pointer from ath12k_dp_link_peer and
>> updates users to retrieve it through ath12k_dp_peer.
>>
>> Patch 2 moves is_authorized from ath12k_dp_link_peer to ath12k_sta and
>> updates authorization handling accordingly.
>>
>> ---
>> Changes in v2:
>> - Rebased the changes
> 
> In my v1 comment I said:
> If the conflict resolution is trivial make sure to carry forward the
> Reviewed-by tags.
> 
> You did not carry those forward, and did not indicate here why you didn't
> carry them forward.
> 
> Please review:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
> 
> In particular:
> Both Tested-by and Reviewed-by tags, once received on mailing list from tester
> or reviewer, should be added by author to the applicable patches when sending
> next versions. However if the patch has changed substantially in following
> version, these tags might not be applicable anymore and thus should be
> removed. Usually removal of someone’s Acked-by, Tested-by or Reviewed-by tags
> should be mentioned in the patch changelog with an explanation (after the
> ‘---’ separator).
> 
> If the v1 Reviewed-by tags are still applicable, you can reply to the cover
> letter and add them in the reply -- my tooling will then pick them up.
> 
> Otherwise reach out to the original reviewers and have them re-review the
> changes.
> 
> /jeff

Thanks for pointing this out.

The v2 changes were limited to conflict resolution and did not affect 
the reviewed code. I've now replied to the cover letter with the 
Reviewed-by tags from v1 so they can be carried forward.


