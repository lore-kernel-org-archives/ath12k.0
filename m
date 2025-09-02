Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85C7CA0FFE
	for <ath12k@archiver.kernel.org>; Tue,  2 Sep 2025 09:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNKh5OataaOsUYbCybqUZmlcLwLP6y3ivLaFhWJGaZs=; b=BpVB10XbwKDoXPaVMNV+WlWcv/
	L/vbxmy0neE7xlNJiFazobJ3mV+IyJi8z4IJmv5+1JYutwVduHmW+Ea1f6xC4gnO++g7P2VP/yb6p
	NxGG8U6xBIc95Y1e2e3DlwhhAOl+Uan9lYVS+SP5IXmRpIUtoypsQkY6ttef1ObAbIpmujzWTyJq1
	KmQWHtUFNyu+V5vi5Dmrt2gw9y1rUY720ERAY4r2+GsJWRU6zsZo9v4opV3xKWRMnIuiE/3c/KEt0
	taImbuza8Z97lAHc4pXNsiZiGsY3Ct2OKq019/gF06M+U2L2nZXP35f90hSQZ4x14aTDr7EiEzA5h
	02wlc77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNOz-0000000GP70-2H4L;
	Tue, 02 Sep 2025 09:34:09 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMum-0000000GExn-2PbX
	for ath12k@lists.infradead.org;
	Tue, 02 Sep 2025 09:02:58 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 6DFA0240101
	for <ath12k@lists.infradead.org>; Tue,  2 Sep 2025 11:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1756803774; bh=gNKh5OataaOsUYbCybqUZmlcLwLP6y3ivLaFhWJGaZs=;
	h=MIME-Version:Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Transfer-Encoding:From;
	b=qI/xLKO2BQFUHIcEKUlOUuHNlOQrtQm7PpWoRuW9UEvGxYM271AobwDQUSM4SbgC4
	 xw+io+xEQoTCIEci/JJOarogAdjZbfnXVYun6LNzxX3wUzwHlmewVpl7r1zQ0WBfm+
	 qa2swBog9aU2JDox/fqDwAGRODAZCqF1Rqg2bQX7fsoDgY/8EkfZuVJ1fvbZ9OZgO/
	 pjCWIUQRmAyjD+lQ919AXGBVFJYQPl8lyKpFHBggjvgBRv4w43JiVXIQLoPPRMQAYp
	 uxLJKsem/zmrYHWDZtnoDEU1/mUGazyByrVUu+ub82KTI3Gk8tMXNUuzh6RcuKt/FE
	 J6EAx6MLn+CsQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cGKWw1VDcz9rxG;
	Tue,  2 Sep 2025 11:02:52 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 02 Sep 2025 09:02:53 +0000
From: a-development@posteo.de
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
Subject: Re: =?UTF-8?Q?=5Blinux-mainline-=36=2E=31=37rc=33-=31-x=38=36=5F?=
 =?UTF-8?Q?=36=34=5D=20RIP=20at=20qmi=5Fhandle=5Frelease=20with=20ath=31?=
 =?UTF-8?Q?=32k=20on=20a=20MSI=20x=38=37=30e=20Carbon=20WiFi=20-=20mainlin?=
 =?UTF-8?Q?e=20kernel=2E?=
In-Reply-To: <554aa5b1-3004-4e98-8f4d-280440f21412@oss.qualcomm.com>
References: <fabc97122016d1a66a53ddedd965d134@posteo.net>
 <623e93fd-73ef-445f-8519-d510d0c36801@oss.qualcomm.com>
 <d8e395e714f33e596884a8f1443347b6@posteo.net>
 <554aa5b1-3004-4e98-8f4d-280440f21412@oss.qualcomm.com>
Message-ID: <f3f6f31b1448aa11e1ad0862d530a977@posteo.net>
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_020256_895119_A267EC9B 
X-CRM114-Status: GOOD (  13.93  )
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

Tested-by: a-development <a-development@posteo.de>

On 02.09.2025 09:56, Baochen Qiang wrote:
> On 9/2/2025 3:11 PM, a-development@posteo.de wrote:
>> Hello - the below diff fixes my issue.
>> I can finally boot/reboot/shutdown AND use my WiFi module - and not=20
>> only Bluetooth.
>>=20
>> Thank you so much!
>=20
> Thank you for quick testing!
>=20
> Would you mind providing a 'Tested-by:' tag such that I can include it
> in the patch?
>=20
>>=20
>> Can you push the fix upstream?
>> Also maybe have a look at the linked issue which now would be resolved=
=20
>> if patch is published?
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D220518
>=20
> This seems the same issue, so yeah I think it should be resolved with
> the diff here.
>=20
>>=20
>> On 02.09.2025 04:51, Baochen Qiang wrote:
>>> On 8/31/2025 11:36 PM, a-development@posteo.de wrote:
>>>> Had the joy to build a new machine.
>>>> I had to switch to mainline kernel to boot at all.
>>>> Blacklisting with kernel 6.16 allows me to boot, or using latest=20
>>>> mainline kernel.
>>>>=20
>>>> Hardware is NEW.
>>>>=20
>>>> Log: https://0x0.st/KH4D.txt
>>>> Alternative:=20
>>>> https://paste.gg/p/anonymous/52779beef5144f2fbe74be2673951f50
>>>>=20
>>>> What should I do?
>>>=20
>>> Could you try if below diff can fix your issue:
>>>=20
>>> diff --git a/drivers/net/wireless/ath/ath12k/core.c
>>> b/drivers/net/wireless/ath/ath12k/core.c
>>> index 8d2839cf1de3..bc40958e885d 100644
>>> --- a/drivers/net/wireless/ath/ath12k/core.c
>>> +++ b/drivers/net/wireless/ath/ath12k/core.c
>>> @@ -2109,14 +2109,27 @@ static int ath12k_core_hw_group_create(struct
>>> ath12k_hw_group *ag)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ret =3D ath12k_core_soc_create(ab);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex=
_unlock(&ab->core_lock);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ath12k_err(=
ab, "failed to create soc core:=20
>>> %d\n", ret);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ath12k_err(=
ab, "failed to create soc %d core:
>>> %d\n", i, ret);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto destro=
y;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
>>>=20
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&ab->core_lock);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>=20
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +destroy:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i--; i >=3D 0; i--) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ab =3D ag->ab[i];
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (!ab)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 mutex_lock(&ab->core_lock);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ath12k_core_soc_destroy(ab);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 mutex_unlock(&ab->core_lock);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0}
>>>=20
>>> =C2=A0void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group=
=20
>>> *ag)
>>> @@ -2191,7 +2204,7 @@ int ath12k_core_init(struct ath12k_base *ab)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex=
_unlock(&ag->mutex);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ath12=
k_warn(ab, "unable to create hw=20
>>> group\n");
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_de=
stroy_hw_group;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_un=
assign_hw_group;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>=20
>>> @@ -2199,8 +2212,7 @@ int ath12k_core_init(struct ath12k_base *ab)
>>>=20
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>=20
>>> -err_destroy_hw_group:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ath12k_core_hw_group_destroy(ab->=
ag);
>>> +err_unassign_hw_group:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ath12k_core_hw_group_unassig=
n(ab);
>>> =C2=A0err_unregister_notifier:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ath12k_core_panic_notifier_u=
nregister(ab);
>>>=20
>>>=20
>>>>=20

