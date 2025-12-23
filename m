Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E14BE6F06C
	for <ath12k@archiver.kernel.org>; Tue, 23 Dec 2025 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRgaOqVJltPfW93WFzFyiZc87xoZ8vjuVQgiQi7aU4I=; b=MSaKCrysQB82I3dG+iUGB3u8Q6
	5rxjf4aWav79Redl4cXydRyYfBhleIVAYd5tIrfL34k3pJffNvCINUZmMU0ShtAxuKqH6JmwrQ47w
	MQEBndw6VUe1whH3A/7VS/mAeWqXtAU+MNibQ75K7BV6flo34+z08jdtypalzBXuGPVk58a3yp4KJ
	ttHiA8vLlkfNDQWrwsnYjOb4qASIHJveKfSQ+b/jjcLH4HHBbRZzkWIFIEJ7EZspGrzaRmCkod1x5
	1WTNoOJZnrf0XrHN6ffDCI76yFH/XmCZyFvqfRAEdu8lKDTHCWU1km/NlzIWSCA4UsiUwCea49dK/
	ruBVz+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXycM-0000000EkC9-0ASI;
	Tue, 23 Dec 2025 09:23:46 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXycI-0000000EkBl-3nyW
	for ath12k@lists.infradead.org;
	Tue, 23 Dec 2025 09:23:44 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-88a2d21427dso47748466d6.3
        for <ath12k@lists.infradead.org>; Tue, 23 Dec 2025 01:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766481821; x=1767086621; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRgaOqVJltPfW93WFzFyiZc87xoZ8vjuVQgiQi7aU4I=;
        b=bUjJGzLpqOMiZXQD/CpKr3aU+Fa0niZkd8/FlpyyRnzUbC8e+P/F7ktzvhXZfxn/tc
         TEUfJkBC3OdHVkqoc/L7l2ia/bJs3e9R5zhsefYyaev1GB5cGPmcIxpcmZr3dlJH2CoH
         VHLMUoc9YWD+dcjDJfpBuYH59a6hvlo4yUaK6cRlwU1n/G+07pEL1XIaVfk2pV+fIKXu
         xFbOzt5tB8ioTEe2o4FrKnQnjSbGRYgVy4TtrA41S3arHZg2ZNdc6FFzLPO43XBvtipn
         G9Xlzx57/Ea8IC4rIjFTBMCYNYF9IfK7iQJPDBO5aLj/O2XBcoqCh/Jeq+lRltlXiX7O
         bhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481821; x=1767086621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yRgaOqVJltPfW93WFzFyiZc87xoZ8vjuVQgiQi7aU4I=;
        b=MdK+q1o7YPhgtSrzTaP6tu/uwNFTz3OsOzQd9QUN7loGdUgbZntiqcj/V62ZhLnPJm
         Bt4jjXIbmVX3kh3zX5ofA4VF1ESu0b3CzJWQIu0NpDr1MOFQPx/SgOULishm6nK4xpSy
         WfBHcGtYOmREDXXzp8F3Shded7apk5ELRkrsyLL21dEJLiXwVd4dnfUpirOAs4+FjAmr
         CIp9YLn8wjOpMEa5bj0lT7RTXCgJIwNIAHlAFeMcDPSDRlvAzCTbsGHt1YpGievRKBXs
         6xIkHpRyVqWcdWTTWl05KnlBmGBFFZHsKopyjhARCRoF1DOZDDMHcZjKWDtS/PrEhSS4
         fYbA==
X-Forwarded-Encrypted: i=1; AJvYcCUKDOLpk2MVOr5qLXwXblF8hJoQy+dE4L26L4hY3k/p/nCBC8OSdK7iKZexnF2toEhHDRGs+Qk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhXsf9xeBVEspWB7YqWRJNkkYYplZ8RhtuZdeZ5kkWOVjg/vZw
	joU6YVrkuxdMqJEp0b1XFECrgtqZ+EM/vMIMh8W+5qlyxqKiMBN3ET0wL+kYqYo5657ejbsqDQS
	0BZmkZGtZy6vmIF3irCIsV3/KNB1RBQ==
X-Gm-Gg: AY/fxX6zpmEKq1e8PyCW8835F7zTE+p3boGeKXXpHT0LXajSCp/fbiX0OBZvV6QhFcv
	RoFe3LtnsqljcaHNNnDlcWuJyJw8rUKcURRbC45XK4jdtHlVFGb5VzxpWPeT9YYHa0/7o9pMdqu
	GV0uXrvKQVbpDHqU9ZMVcCIZBcX29df9ucDQC2pt/9+aYwH+9RfjdLtDYNyTcdJTzBxakrfdxsc
	EooM2x7euHT0GqSzQkRE2YIBTkmGpnGojSSolFgk22xBKBvnd3kBFL4bdxgEmt4FqRYjbtvN04A
	q2jpCtUfNUAxe6qoFKxgBLQCXRM=
X-Google-Smtp-Source: AGHT+IFoBGoGMK1AwB+5JaUus3NhgS6DL3IN4kS99/cYzOlE5tfIkUewlkbJ9lfanT1+W800KHA0Cfkb3h8MpQ75Sww=
X-Received: by 2002:a05:6214:3985:b0:880:460a:96ce with SMTP id
 6a1803df08f44-88d86e4558amr227453306d6.63.1766481820935; Tue, 23 Dec 2025
 01:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie> <c29de60c-c7c6-45d7-8d90-616df23df01c@kernel.org>
 <v4hxei4t7n6ebvw6heoccei2t3mskq7uo7zejv6dyvvq5fr5sv@xzpsiic5x7a4>
 <2ff993a7-0fda-4337-9acc-92aaa75be750@kernel.org> <blbyjjkcxwnm5otgkodckxl2gx5ncelhnpqire7jt3yfdvszef@jgk6o7yvn2vo>
 <8b79b662-931f-4634-9389-6602d353d67a@kernel.org> <2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62>
In-Reply-To: <2ixwny6hzumlqmok5cjwutvtk7nzmx4t3dhxc44ao4l2u755pj@n6m7jyxf2o62>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Tue, 23 Dec 2025 10:23:04 +0100
X-Gm-Features: AQt7F2r6BWEGW9jx_jVMTGjMo3TtOBV47eY3f046xBhruPQH5M5YwVt70mMlRT0
Message-ID: <CA+kEDGHOpWm6Gbcr9MFfpUKoBo=Xys9Wz8J1+F+saRoYbEdpbw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bod.linux@nxsw.ie>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Dale Whinham <daleyo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_012342_995419_2351AACA 
X-CRM114-Status: GOOD (  71.39  )
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

Le mar. 23 d=C3=A9c. 2025 =C3=A0 07:31, Manivannan Sadhasivam <mani@kernel.=
org> a =C3=A9crit :
>
> On Mon, Dec 22, 2025 at 03:22:55PM +0100, Hans de Goede wrote:
> > Hi,
> >
> > On 22-Dec-25 14:41, Manivannan Sadhasivam wrote:
> > > On Mon, Dec 22, 2025 at 01:41:48PM +0100, Hans de Goede wrote:
> > >> Hi Mani,
> > >>
> > >> On 22-Dec-25 12:45, Manivannan Sadhasivam wrote:
> > >>> On Mon, Dec 22, 2025 at 11:23:18AM +0100, Hans de Goede wrote:
> > >>>> +Cc Mani
> > >>>>
> > >>>> Hi,
> > >>>>
> > >>>> On 20-Dec-25 07:04, Bryan O'Donoghue wrote:
> > >>>>> On 20/12/2025 00:21, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wr=
ote:
> > >>>>>> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> > >>>>>>
> > >>>>>> For some devices, Wi-Fi is entirely hard blocked by default maki=
ng
> > >>>>>> the Wi-Fi radio unusable, except if rfkill is disabled as expect=
ed
> > >>>>>> on those models.
> > >>>>>>
> > >>>>>> Commit c6a7c0b09d5f ("wifi: ath12k: Add Support for enabling or
> > >>>>>> disabling specific features based on ACPI bitflag") added a way =
to
> > >>>>>> support features set via ACPI, including the DISABLE_RFKILL bit.
> > >>>>>>
> > >>>>>> Add a disable-rfkill property to expose the DISABLE_RFKILL bit
> > >>>>>> equivalent for devices described by a Devicetree instead of ACPI=
.
> > >>>>>>
> > >>>>>> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@g=
mail.com>
> > >>>>>> ---
> > >>>>>>   Documentation/devicetree/bindings/net/wireless/ieee80211.yaml =
| 6 ++++++
> > >>>>>>   1 file changed, 6 insertions(+)
> > >>>>>>
> > >>>>>> diff --git a/Documentation/devicetree/bindings/net/wireless/ieee=
80211.yaml b/Documentation/devicetree/bindings/net/wireless/ieee80211.yaml
> > >>>>>> index d89f7a3f88a71d45d6f4ab2ae909eae09cbcaf9a..c10a4675640be947=
cd0b5eaec2c7ff367fd93945 100644
> > >>>>>> --- a/Documentation/devicetree/bindings/net/wireless/ieee80211.y=
aml
> > >>>>>> +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.y=
aml
> > >>>>>> @@ -29,6 +29,12 @@ properties:
> > >>>>>>         different 5 GHz subbands. Using them incorrectly could n=
ot work or
> > >>>>>>         decrease performance noticeably
> > >>>>>>
> > >>>>>> +  disable-rfkill:
> > >>>>>> +    type: boolean
> > >>>>>> +    description:
> > >>>>>> +      Disable rfkill for some devices on which Wi-Fi would be e=
ntirely hard
> > >>>>>> +      blocked by default otherwise
> > >>>>>> +
> > >>>>>>   additionalProperties: true
> > >>>>>>
> > >>>>>>   examples:
> > >>>>>>
> > >>>>>> --
> > >>>>>> 2.47.3
> > >>>>>>
> > >>>>>>
> > >>>>>>
> > >>>>>
> > >>>>> Is this really a hardware description though ?
> > >>>>
> > >>>> I would say yes it is. The wifi chip has an rfkill input pin and
> > >>>> things will be broken when that pin is hardwired to a fixed value
> > >>>> rather then being actually connected to a GPIO from say
> > >>>> the embedded controller.
> > >>>>
> > >>>
> > >>> IIUC, even if the M.2 slot has the W_DISABLE1# signal routed from t=
he host,
> > >>> the device won't make use of it as there is no physical connection.=
 So you want
> > >>> the WLAN driver to change the state through SW?
> > >>>
> > >>>> So I think that we would need here is not a disable-rfkill propert=
y
> > >>>> but some way to indicate in the DT-node that the rfkill input pin
> > >>>> is not connected and thus should be ignored.
> > >>>>
> > >>>> This (the rfkill input pin being not-connected) IMHO very much
> > >>>> is hw-description.
> > >>>>
> > >>>
> > >>> Though we can argue this way, I would prefer to handle it in the dr=
iver. For
> > >>> example, with my M.2 series, we will end up describing the M.2 slot=
:
> > >>>
> > >>>   connector {
> > >>>           compatible =3D "pcie-m2-e-connector";
> > >>>           w-disable1-gpios =3D <&tlmm 117 GPIO_ACTIVE_LOW>;
> > >>>           ...
> > >>>           ports {
> > >>>                   ...
> > >>>                   endpoint@0 {
> > >>>                           reg =3D <0>;
> > >>>                           remote-endpoint =3D <&pcie4_port0_ep>;
> > >>>                   };
> > >>>           };
> > >>>   };
> > >>>
> > >>> Then if we use a DT property to convey the RFKILL pin state of the =
device, we
> > >>> would need to describe the endpoint device in DT and hardcode the s=
tate:
> > >>>
> > >>>   &pcie4_port0 {
> > >>>           ...
> > >>>           port {
> > >>>                   pcie4_port0_ep: endpoint {
> > >>>                           remote-endpoint =3D <&m2_e_pcie_ep>;
> > >>>                           disable-rfkill;
> > >>>                   };
> > >>>           };
> > >>>   };
> > >>>
> > >>> So this will essentially make the M.2 device non-swappable unless y=
ou change the
> > >>> DT since you've how hardcoded the device property in the binding. T=
his is
> > >>> something I try to avoid to make the M.2 slot really swappable.
> > >>>
> > >>> For this reason, I would prefer to handle the RFKILL state in the W=
LAN driver
> > >>> using the device specific compatible. This will be problematic only=
 if multiple
> > >>> cards of the same Device ID have different RFKILL state and the dev=
ices are not
> > >>> distinguishable even with sub IDs.
> > >>
> > >> I think we're miscommunicating here. I'm not talking about the card =
having
> > >> a broken rfkill implementation, I'm talking about the M.2 slot on th=
e mainboard
> > >> having e.g. W_DISABLE1# hardwired in such a way that cards would int=
erpret it as
> > >> having to always disable their wifi radio which is very similar to w=
hat is
> > >> happening on the surface device. Except that on the Surface there is=
 no M.2 slot,
> > >> the wifi is just soldered onto the mainboard I believe.
> > >>
> > >
> > > Ah, sorry for the confusion. I did misinterpret what you said.
> > >
> > >> Based on experience I'm pretty sure we will encounter M.2 slots whic=
h such
> > >> a hardwired W_DISABLE1# signal sooner rather then later.
> > >>
> > >
> > > But it makes no sense IMO. Vendors will usually connect unimplemented=
 W_DISABL1#
> > > GPIOs to a pull-up resistor so that the radios are operational all th=
e time. I
> > > don't see how they would expect a WLAN or any device with a radio to =
be
> > > connected to the slot if they hardwire the pin to low.
> >
> > Pins which are considered "unused" are also often hardwired
> > to ground. If the m.2 slot is tested with a wifi-module where
> > the W_DISABLE1# signal is not used on the wifi-module I can
> > easily see this happen. I've seen a lot crazier / buggy stuff
> > happen.
> >
> > > Are you sure that on the surface the pin is actually hardwired to low=
 and not
> > > connected to a GPIO that drivers the signal low?
> >
> > I don't know what is the exact problem on the Surface. I just
> > expect to see this more often, we've certainly seen lots of
> > issues like this on x86 laptops. Things end up looking like
> > the hard rfkill is activated all the time (and we often don't know
> > if this is a fw issue, or an actually hardwired problem).
> >
> > Just an example from the top of my head the Broadcom windows
> > drivers use different BT fw files for the same wifi/bt combo
> > chip depending on the vend:prod id pair. One of the things which
> > is different is that some fw files invert the BT rfkill signal
> > because it is wired wrong (or there is an EC fw bug) and this
> > is then worked around in the bt fw.
> >
> > As we see a growing proliferation of arm64 laptops I fully
> > expect all the fun from having a gazillion different designs
> > with a time to market rush behind them result in similar issues
> > on arm64.
> >
> > Note I'm not saying we must tackle this today, we can wait
> > till we see the first case in the real world I guess.
> >
> > I just thought that based on my experience this is more or
> > less bound to happen, we could comeup with a solution for
> > this now and then this solution could also nicely serve
> > the Surface case which started this thread.
> >
> > But we can also delay tackling this and come up with some
> > bespoke solution for the Surface case, like as suggested
> > maybe a special compatible string ?
> >
>
> Hmm. If we want to go with the DT property, I'd use something like
> 'broken-rfkill' or 'broken-w-disable1' or similar in the connector node, =
not in
> the device node. This will convey the fact that the RFKILL switch is brok=
en
> in the connector or the hardware topology is not known.
>
> But we do not have the connector binding merged yet. Until then, I'd sugg=
est to
> keep the hack in the WLAN driver by using the platform compatible and Dev=
ice ID:

If that suggestion is accepted, please keep in mind that this
issue is also impacting the Surface Laptop 7 family, with the
"microsoft,romulus13" and "microsoft,romulus15" compatibles.

The SL7 rfkill issue is mentioned here:
   https://github.com/bryce-hoehn/linux-surface-laptop-7
or here:
   https://github.com/linux-surface/linux-surface/issues/1590
for reference.

> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireles=
s/ath/ath12k/core.c
> index cc352eef1939..481778eb2c95 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -77,6 +77,16 @@ static int ath12k_core_rfkill_config(struct ath12k_bas=
e *ab)
>         if (ath12k_acpi_get_disable_rfkill(ab))
>                 return 0;
>
> +       /*
> +        * TODO: On Microsoft Surface Pro 11, OS is not able to control t=
he
> +        * RFKILL switch. So keep the RFKILL disabled until the OS learns=
 about
> +        * it. Ideally, this info should come from the connector node of =
the
> +        * board DT file. But since the connector DT node is not availabl=
e,
> +        * implement the hack in the driver.
> +        */
> +       if (of_machine_is_compatible("microsoft,denali") && (ab->id.devic=
e =3D=3D 0x1107))
> +               return 0;
> +
>         for (i =3D 0; i < ab->num_radios; i++) {
>                 ar =3D ab->pdevs[i].ar;
>
>
> Once the connector binding gets merged, hopefully we can add the DT prope=
rty and
> use it in the driver.
>
> > > It is just hard to believe that board designers can do a blunder like=
 this.
> >
> > Heh, you won't believe all the crap happening on cheap
> > x86 devices.
> >
>
> Coming from the DT world, I thought the ACPI world is superior, but this =
reminds
> of the fact "No world is superior to another" :)
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

Thank you,
J=C3=A9r=C3=B4me

