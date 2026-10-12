Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D8DCA9EC5
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bj4x0yoc0hxWkj+NH/M3l1jP8L4sufydJgUS05eilps=; b=ZRegaLVhvzLjx4BxAdlBgudzvI
	0w7Ld2IKALM8ry7JNRUwPUSqFZGjTLJt8x6Yl6kHFUeXSwwL/SBxNFMgT05YRsfKcitwxVbgrdf8U
	pYvjtF7tofQ3lulSnLwa+dzAx5SOG8Q9Ub1GimzBpiHaER6Y0VWg9r56/vtBszWQvkv2+o9X0zcgi
	JphkYGeJBnmOO3iFvUqBLi6wOCL2pFDRGniS1lnKoDZLsrcndILxqVuZfTZ8WW42HNpa/EIobawKI
	SHnOGeMDDvr36U3yOT3DY/QqwR1YQ28l5vqY5YT37s3ksKEHxVwPdDGivHGcBxvLQYwysBBCAJGNv
	ZQuSHjdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHX4-0000000AkTj-0I1g;
	Mon, 12 Oct 2026 15:01:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHX1-0000000AkSW-0W0s
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 15:01:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC02Ui2786075
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 15:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bj4x0yoc0hxWkj+NH/M3l1jP8L4sufydJgUS05eilps=; b=nfDuDA8K3pjv+kGa
	HIe/ifoj92KOAgGvHTYZd6fTWoNv7Cix+i/O5rT9FnkP/2wCQDPMPg+EPaqFWt7P
	VAHJnoW8F6SHhkzhAQOuFKW3pI9vOrD676IxDBiHJPJc+Wg/IF48NoLuakpXSQ7c
	2CyxBOMwXpWDmxKZyEmGb+UvMt9WaZ2opDNV9OcYweMJTI261FK0Hp20vE85AkiN
	A3BUKva+eCWkWrzMRrHF7tbTG+g1I5nzkIqupNbO0u2sep+mGrg76wOidcwlV1ye
	vJQTJ2eoMC2DZ15nWSWp6FQy1MxY4L4ocHSmIkVpCnFL6L1MpKxchbNqzHkPp/pb
	BnSGwA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffh8u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 15:01:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so1212520eec.0
        for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791817280; x=1792422080; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bj4x0yoc0hxWkj+NH/M3l1jP8L4sufydJgUS05eilps=;
        b=IRUUPyv9JvwALY6XkJGNeV5Npy9lo1UuIeyepgmlvvtJ/ko4XHQJRG1POJTNlXPC0J
         Ja6dxF1OmrQ1C3VbyUbWwAaKEezZQfrtM/yn9+pXSqkOHndfkTrlWA3DqoO59wOpmApm
         ndH6EtfXC41WSUqJcha8NZOd4k8SZQDkExtC5qpG/IQY0J/w+tAf8aXmSPZZIZcuPdEY
         k/pxfBNCoFrLcSUbxNkZ6PzMP5y3WxPwSomVR6Ugf5cyIqbWTh128AfMWMmhyNw1sKxa
         wDFAL3Lu5cmu1zrBE5s4WJK5HobTWL/8TgzjFi02VaWsduFoRMQlq5eDK3wCa0xJ7KY4
         yx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817280; x=1792422080;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bj4x0yoc0hxWkj+NH/M3l1jP8L4sufydJgUS05eilps=;
        b=erWeJoRQdNp+/mIop4bDjZy9sSyaY6Ad93EIMQU06FyD2rGvK7UkDuT1TTzamo4bk2
         Rd5kNUG4EPurpK+muNV6LwUm0yihsa8fJup2oNftw3l7e7yTmi3sv5gZeBodu0rsZIxy
         AOt7sONZd4dNz//v1t10i0wRMJvBZ/ERb8p+XZ5Vl4NnVzYQvxpGeKP7YduhHq8E7EOQ
         eNofldU4GaC9UwqL4HrQuFFV+QQZSYrAWSdIkvBPJh35ADGPdHqNXLoBhIR4tgweQ24R
         8eShCfG73f+n6wEneY0i9P//GOnAKhvO3WrKRz80V4iIhaZPiz6vpGdVRvx7Dw4FdbLC
         It9Q==
X-Forwarded-Encrypted: i=1; AKwUvBykMlsW2HTRqJGeizbaN2Uoi/9fevjXlkg5ZyYagFXXJJDNXPd2vYUFAGCGBmd5em+earb8Gn4=@lists.infradead.org
X-Gm-Message-State: AFq9FYIEhSvjjOpfQzdsghCJJdc+8liTN74qRLg7wbQATpU5uRtEkMfq
	bqvOfQogPvZs5kqVensbuVgOSdnPvQquLZq/pw4iySOblwSIyyri8a89qUdxdHVYXZZeGdtNBA4
	rps88b6N5zpipRB0Ws0xCZh8rwJzJHPBX/8hCstPTEiUGmdxu59LaQyprxTgRl8eY
X-Gm-Gg: AYBFou1voV4+Sm/Cqc8JBTgpIjS82qJhsfGXtbXPS0zdXFFEgbChTvx026cakInVik8
	+GX7MjGEY77LcII9/wNF53qqpCKSLaGGwOBT847hEFFnTEoQg7Acxp+r4YdZpF5bk62RbIhQ2xr
	K2PKwlRmZ1c59RQlN4ngFzWJFGAaZcpMj7oiuSxBm/SRwkApji9XpHLDOzCOfeLCoaje2xyMLH6
	zF2GtY1YjJFMR+ejPCcYR+S9AYxj1+YU5V0EA8lY9OVn2TYXe+oaTB0efHqit/f93D2bfl38pGT
	k23GaM260dsbdJZoUhdD88fRLiHUNRSXzgWg8Tx3GOKx0QWpckGO48k2Gzm2DdP+uHaivdStNIE
	xKOwCKhhSWJKSzGdp/2kQXF3yJUyb4BhFasZDbObPABQC1cW6prMTEXGsic8I
X-Received: by 2002:a05:701b:4585:10b0:14f:5870:2e9c with SMTP id a92af1059eb24-16a15460f46mr12178046c88.23.1791817279936;
        Mon, 12 Oct 2026 08:01:19 -0700 (PDT)
X-Received: by 2002:a05:701b:4585:10b0:14f:5870:2e9c with SMTP id a92af1059eb24-16a15460f46mr12176562c88.23.1791817257835;
        Mon, 12 Oct 2026 08:00:57 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm40086574c88.9.2026.10.12.08.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:00:56 -0700 (PDT)
Message-ID: <fc1124b6-e0eb-4760-8c94-54a5cf15b10a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 08:00:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NAPI resource leaks in AHB
 external IRQ paths
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
 <40903cb4-e39e-43de-be81-27a5f29aeeac@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <40903cb4-e39e-43de-be81-27a5f29aeeac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OSBTYWx0ZWRfX+538k1B4jDoQ
 kDQntEQ8a7kYgitbWNbjd7ALgGt9WqaA2LK1hc2VrH6wVa5dqEp6UtAX41glCJTgfA/bGAGmTVp
 wyXhAhPviolQNILYlNlR1Ejgf7xqVSnzlwpyI+KurpqSe7wFtOLtOtGSUfq418iefmtEE5Gcffi
 VHtcf+4HmVBVbFYx0MB1U4eoWY3Ky3JHcatz1yaE8IkOZDT57uq9NC6MzhWsTpX31TujxxWtmBV
 uOIChOzIyLFNbDlTy9A9NQ6ryV5+FmfLzTAC1OJEl/eEy34R55TFR/C81Un5osGHsGcQQ+Fx+D0
 CGxWrVA90VBrZzDVniQ0Prymg+E6Z10dkTJ9s0BCLpheNaDTLAZoCFC5Luvr2N81o1jOFTvMcaj
 wCCbfan1fEpFMeVkTrDnt8vNFhlvhpcG9HmeDqk8H1zuKur45/i2HK510uem7aOKlmQ9beNsF99
 /KlbFzp9rFZKPoAqAiA==
X-Proofpoint-GUID: MSnoK01cKScgLrRgbjV58EpH1A16hfbd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OSBTYWx0ZWRfX1eO8lzqciisD
 jY27QU5JgHXIdXmmwuCXA9NY4+DV0iesZO+nhbAtOHIjqTEflB2ZOH3Ohd0ZzrtL3i7kPH5luRy
 Dd299ORiGiDTH+0sLoYVGsC/vHHddHE=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accf641 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=OA1JIVzn2EqTZagBuBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: MSnoK01cKScgLrRgbjV58EpH1A16hfbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_080139_279902_38A2BC39 
X-CRM114-Status: GOOD (  14.80  )
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

On 10/9/2026 1:17 PM, Jeff Johnson wrote:
> On 9/30/2026 9:54 PM, Aaradhana Sahu wrote:
>>  static int ath12k_ahb_config_irq(struct ath12k_base *ab)
>> @@ -1353,7 +1382,7 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>>  	ret = ab_ahb->device_family_ops->arch_init(ab);
>>  	if (ret) {
>>  		ath12k_err(ab, "AHB arch_init failed %d\n", ret);
>> -		goto err_rproc_deconfigure;
>> +		goto err_free_irq;
>>  	}
>>  
>>  	ret = ath12k_core_init(ab);
>> @@ -1367,6 +1396,9 @@ static int ath12k_ahb_probe(struct platform_device *pdev)
>>  err_deinit_arch:
>>  	ab_ahb->device_family_ops->arch_deinit(ab);
>>  
>> +err_free_irq:
> 
> my review agent notes:
> **Misleading label name `err_free_irq`**
> 
> The label name implies IRQ teardown, but the IRQs registered via
> `devm_request_irq()` are automatically freed on device detach — no explicit
> free is needed here. This label only frees NAPI/netdev resources. Suggest
> renaming to `err_free_ext_napi` or `err_free_napi` to match the actual
> operation and avoid confusing future readers.
> 
> No need to post a new version just for this -- I'll make this change in my
> 'pending' branch if the reviewers are otherwise ok with your patch
> 
>> +	ath12k_ahb_free_ext_napi(ab);
>> +
>>  err_rproc_deconfigure:
>>  	mutex_lock(&ath12k_rproc_info_lock);
>>  	ath12k_ahb_deconfigure_rproc(ab);

Pending version with the label modified:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=ca18680289858564a3bddf3df67aa758b5f16d8a


