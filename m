Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E7160B57D1
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i/Bcx7B4;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UdQunzKt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ais0AKWw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BIBz3g0Dj1YwTMilYZMcJh+qL6MW6i+rcIv9hHtYQ7Q=; b=i/Bcx7B4LGzRR6
	gSJKgoIhHiax3aTttDHLkVvmjSTWRDcoN9yGFxXQFGuUA/dle3QvupIi6tLOUwM4GsNexsnpKN+Fk
	6G2k2kkEQmwo0tu3wJ6XowQFIQ/CCpV8ZhJ8uEAX3N60Scc14o2I9ZzGA//TxPLfrEUV1H1nJmQy2
	3EH1yW+yYqGLriyUu1zl8LvhnrmjdeXQy71PBLY6XHOB6ebFtLYhwgLVl5pTgSgHiQ4WslSozHg+b
	wQcAk7k9Q7WZaX7vUB/XB1jr2CKWK7NH3qg4SrcuLWy22kGJvcep6/Vpi5uKhZDH4j2vgfUCIHTZI
	ad+www+exMtDFrMiSDMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuLq-0000000HDBZ-2H1p;
	Mon, 02 Nov 2026 15:53:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuLo-0000000HDAd-0dUK
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 15:53:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpSlU4070572
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 15:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BIBz3g0Dj1YwTMilYZMcJh+qL6MW6i+rcIv9hHtYQ7Q=; b=UdQunzKtyEZiHTk5
	9btGeXxsfUOWy5VLcYYdwG5KOkCRLW/mRfEA+QeRBUQS9inPkBKBhrNLRCq2DEaE
	zFwuj9pC6CFH4u8X1jq1/C9Ju9wSL//7BVoRXVAFPYcW9wewVHsT5L/MsdxoVVca
	NzdXsxDEr/7FCNGnMonXFdHHTsqDcBmwn/o/Gz1R1uqSSvFqnY9nTjr4x5GFIv3P
	iFRh80qHDZsNGzeKfw93YYvD24txLbBLf8VYfeFFR/zXo+ILdFUF+rZOF16y1No1
	7FYwG8c3W5kBG4/Elc6QWpZkvSKpKzm60CB6xlhvpmN/W7JI1LoLl8L9bVDzFviG
	GRcswA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5h3fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 15:53:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a1e2485fdso8240124eec.1
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 07:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634814; x=1794239614; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIBz3g0Dj1YwTMilYZMcJh+qL6MW6i+rcIv9hHtYQ7Q=;
        b=Ais0AKWwCR85kuQtQRdXDTtKlf3w94yES1FWdBuDEYPB5S4H/NhBCnZGcbirgDVjO9
         yvlkL5lRgYwqahKUcd0jqHclqRsLwy8fQfa1YqVK2mhdz7rVuote52YuzciI87VjMBld
         7fkISVuTxgEIsuw6om4dMHJj/LdXqgwifhxP4u2afHKfNHQpkME5crKqzNYA+FLDU7Nc
         vUvT/uJEhhqWVfB+i7FYvPa/EoG+jA/WEKzYo5o56p/g24VB7jKl0exbmFMgfM2bWoEK
         4HqcA5gCF2DNDYohCUvBHpAf1WWVQNOjoUAr7F3XlCQlSQXt6Bm/a4Vta2UuPd4JbF4a
         Zqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634814; x=1794239614;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIBz3g0Dj1YwTMilYZMcJh+qL6MW6i+rcIv9hHtYQ7Q=;
        b=l4lpmtIksPNoLpqpFOoqRyHW5CchMCigoBu4ZWS2L4sYC1rv3CUtPyxeXyQgCsB2IN
         784MG4J0mBnK3DTFW+gIsqQn3D3pUq+mjlIvy5+Jtd8soy/yYTH3gDRPihY6+vD8XDJw
         j1tkrzQRwvL5+gULtKLye2o1ASyCu+ZFBmMhjrj6WYjx0uznfJ80VdoDywY5ATOJf3yy
         GWbPTKjxucBIsDEbkwbKjoPxkbAp6zEhPtAZwWSQVRFnDyLNG//fbfHK+ABafx/KZqJi
         WIDkmUzQ7Iy3NN3zwmgWDWJGlcrW6J5RgveGHWRVm6VVTZRhceQFlndW9EUQRO6Y+ybj
         m2Mw==
X-Forwarded-Encrypted: i=1; AKwUvByN2nxiDxSLN198hGyIxZqwcwq16jTSuucSRWhxT6kNkI4wvyXhcOddnqpOPDHasED0Uwo/6g4=@lists.infradead.org
X-Gm-Message-State: APuU4Z9QOwBcFccPT9HbjzPQWJWboP7xeY+FeALdhaKXVHW+5vRO2p8U
	qdrioADtkkNt0OGimk91tyB7u4c439HvU8BtiZ34Mu42OorTNfE29bOLy6gBhlwEAUARDr0Pr8m
	zQLbKj6mZiwqbC7+GbfxetRIDIMIcmZmFiWn32LBvcoLDVyGxMy8BzKgctBDXI5aT
X-Gm-Gg: AYBFou1wgC0mNLbogit74Ll9mz400UKW7HJeOLgD7+fLc/OkaMWoidw7WqZKhuNktWT
	oZ0vSjZnLk4M360ZfgUSrYVCZvU1keCgDQVVFYW0SxeNnzd0AoimLdFlfr/Zmwsd3uD6FTaWHPI
	/FOSBI/v2C1SfWHoRhHIummB7Ws4LRq6FY55dcIGcgHLuJFOasJgCVtIiLVSRhr6FM3K2ufFVxb
	jnaEMWfXIB+OWJI1l6dYM0wCrmgRkXKAMqP1UPou2WjDksTLK05/ghTW0EJy0UotoR3v+/irqY9
	wJaOlGwqyta8NudSPDTBiN0BmdJeRkcW8y5iDuMy8035hDfx7ao12Iek0eu2N0ommFphqePkZSx
	9wrRKELJjgHg61H84wuwdzPffWG26Oh/YH7waa8o67/SRNVmPHM2a8ngb/zuWPGdw0zDGIO8YxV
	qX6MU+jw4eokpPO1ig1vzQy2FNCd84Kw==
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr15944162eec.17.1793634813619;
        Mon, 02 Nov 2026 07:53:33 -0800 (PST)
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr15944086eec.17.1793634812852;
        Mon, 02 Nov 2026 07:53:32 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm40754304eec.7.2026.11.02.07.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:53:32 -0800 (PST)
Message-ID: <9d97e1c0-3f07-465d-8952-ee33b9aba7e4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 07:53:31 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: move arsta grouping from
 rhashtable to per-radio hashtable
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>
References: <20261021173318.1935569-1-maharaja.kennadyrajan@oss.qualcomm.com>
 <692a240a-3995-47bc-8360-136610fb6a89@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <692a240a-3995-47bc-8360-136610fb6a89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8b1fe cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Cw9SDZpd3yfYGb6VdUYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 8_3bWpbYz0VYv3KsmZ_OTEmklF8aOTW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXy1Bo1KY+TN4L
 s+qYN20AdGSlzy3qWo2DTBzk5BFPRo8luZvS4huWpwYAOsbOR/2E6sgOzgKJLBxdXq65CKIgtlC
 c7XU5R3y4nwc8KER/ioiO7Q78uSTbcKYlFTUV845lbPCWAopxLvnppGYCgh+CK048PeLflZQTCx
 wKoNBuDT4YbJzx6LXq5jXOjM7M4KrQQAG3zc+IEQEmSGU6P6GU6CjcWVWAtm3kbaFSbQrbNHlqz
 C1VJXQBlU7rdHf1AOZLTYiBEkuVst82NSmfzPI52Sh16XUWJHWsT5okdAaVNqIJRdXcBzw8qxia
 rvXIv+EoVUd+ZiUb3JLCS1vlpECDt1A9ESEdKmaFmNV2RE11V6LXtTdgGaP5r7kHNpwDkmEHGV4
 FRxBM9l4nIuCJUHO0J+ExPiEObx2V935Imzy8HtpwcE7MD5tJZJdWL16bafm64Qnvy+jpS5pW7d
 A7y71b/SVEMoG5hkr0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX8nHilQmQee38
 C9Iwm7jSCdoC2EGbuxQoyROYQFnBOqcFZuUz4ZANT7v1RUUr+iZu5x8smq8Y72n5/V5IpD4vNSR
 E2FmUiiIds7ARkObOz/EchSYdX5zzZs=
X-Proofpoint-GUID: 8_3bWpbYz0VYv3KsmZ_OTEmklF8aOTW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_075336_314074_99EA7001 
X-CRM114-Status: GOOD (  10.74  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/1/2026 5:47 PM, Baochen Qiang wrote:
> On 10/22/2026 1:33 AM, Maharaja Kennadyrajan wrote:
>>  	if (ret) {
>> -		ath12k_warn(ab, "Failed to add arsta: %pM to hash table, ret: %d",
>> +		ath12k_warn(ab, "failed to add %pM to hash table %d\n",
> 
> it is warning, so you can have colons before error code:
> 
> "failed to add %pM to hash table: %d\n"
> 
> 
> with that fixed:
> 
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

I'll clean this up in the pending branch, no need to respin

/jeff

